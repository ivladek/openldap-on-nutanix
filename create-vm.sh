#!/bin/bash

# v01.00.00 21.08.2022
#
# Script to generate script :)
# for fully unattended deployment of Ubuntu VM on Nutanix PC, with OpenLDAP inside
#
# usage without any restrictions
#
# created by Vladislav Kirilin, ivladek@me.com


echo -e "init script data"
. config/script.config
echo -e "init user data"
[[ -f config/sample.config ]] && . config/sample.config || config/user.config

if [[ "$OSTYPE" == *"linux"* ]];
then
  SEDcmd="sed -i "
  # check mkpasswd presense
  dpkg -l | grep whois > /dev/null
  if [[ $? != 0 ]]
  then
    echo -e "mkpasswd is absent and needed to be installed - please enter password for sudo"
    sudo apt -y install whois
  fi
  hashVMpasswd=$(echo "$VMpasswd" | mkpasswd --stdin --method=SHA-512 --rounds=4096)
else # macos does not have mkpasswd and sed has different syntax
  SEDcmd="sed -i ''"
  # check passlib for python3 presense
  pip3 list | grep passlib
  if [[ $? != 0 ]]
  then
    echo -e "passlib for python3 is absent and needed to be installed"
    pip3 install passlib
  fi
  echo "create $DIRtemp/mkpasswd.py"
  echo '#!/usr/bin/env python3
import sys
from passlib.hash import sha512_crypt
print(sha512_crypt.hash(sys.argv[1], rounds=4096))' > $DIRtemp/mkpasswd.py
  chmod +x $DIRtemp/mkpasswd.py
  hashVMpasswd=$($DIRtemp/mkpasswd.py "$VMpasswd")
fi

echo -e "create file to init LDAP - create OU for users and groups"
LDAPdomainDN="DC=${LDAPdomain/./,DC=}"
LDAPadminDN="CN=admin,$LDAPdomainDN"
echo -n "
DN: OU=users,$LDAPdomainDN
objectClass: organizationalUnit
objectClass: top
OU: users

DN: OU=groups,$LDAPdomainDN
objectClass: organizationalUnit
objectClass: top
OU: groups
" > "$DIRoutput/$fileLDAPinit"

echo -e "create file to enable LDAPS"
echo -n "
DN: CN=config
changetype: modify
replace: olcTLSCACertificateFile
olcTLSCACertificateFile: /etc/ldap/sasl2/$VMfqdn.crt
-
replace: olcTLSCertificateFile
olcTLSCertificateFile: /etc/ldap/sasl2/$VMfqdn.crt
-
replace: olcTLSCertificateKeyFile
olcTLSCertificateKeyFile: /etc/ldap/sasl2/$VMfqdn.key
" > "$DIRoutput/$fileLDAPtls"

echo -e "create file with LDAP root password"
echo -n "$pwdLDAProot" > "$DIRoutput/$fileLDAProot"

echo -e "create file for SLAPD unattended installation"
echo -n "
slapd slapd/root_password password $pwdLDAProot
slapd slapd/root_password_again password $pwdLDAProot
" > "$DIRoutput/$fileLDAPanswers1"
echo -n "
slapd slapd/internal/adminpw password $pwdLDAPadmin
slapd slapd/internal/generated_adminpw password $pwdLDAPadmin
slapd slapd/password1 password $pwdLDAProot
slapd slapd/password2 password $pwdLDAProot
slapd slapd/domain string $LDAPdomain
slapd shared/organization string $LDAPorg
slapd slapd/backend string HDB
slapd slapd/purge_database boolean true
slapd slapd/move_old_database boolean true
slapd slapd/allow_ldap_v2 boolean false
slapd slapd/no_configuration boolean false
" > "$DIRoutput/$fileLDAPanswers2"

echo -e "encode files to base64"
for f in ${file2b64[@]}
do
  echo -e "\t$DIRoutput/${!f} >> $DIRtemp/${!f}_b64"
  b64="${f}_b64"
  export ${b64}=$(openssl base64 -in "$DIRoutput/${!f}" | tr -d '[:space:]')
  echo -n "${!b64}" > "$DIRtemp/${!f}_b64"
done

DATAtype="user"
SCRIPTfile="$DIRtemp/${DATAtype}-data_process.sh"
DATAfile="$DIRoutput/${DATAtype}-data"
cp "$DIRtemplate/${DATAtype}-data_template" "$DATAfile"
echo -e "#!/bin/bash" > "$SCRIPTfile"
echo -e 'echo "create user-data file for cloud-init"' >> "$SCRIPTfile"
chmod +x "$SCRIPTfile"
for v in ${userdata_vals[@]} ${file2b64[@]}
do
  echo "echo -e \"\t{{$v}}: \"""'"${!v}"'" >> "$SCRIPTfile"
  echo "$SEDcmd 's|{{$v}}|${!v}|g' $DATAfile" >> "$SCRIPTfile"
done
echo 'echo -e "\tadd content encoded with base64"' >> "$SCRIPTfile"
for f in ${file2b64[@]}
do
  b64="${f}_b64"
  echo "echo -e \"\t\t$f: from $b64\"" >> "$SCRIPTfile"
  echo "$SEDcmd 's|{{$b64}}|${!b64}|g' $DATAfile" >> "$SCRIPTfile"
done
"$SCRIPTfile"
USERdata_b64=$(openssl base64 -in "$DATAfile" | tr -d '[:space:]')

DATAtype="vm"
SCRIPTfile="$DIRtemp/${DATAtype}-data_process.sh"
DATAfile="$DIRoutput/${DATAtype}-data.json"
cp "$DIRtemplate/${DATAtype}-data_template" "$DATAfile"
echo -e "#!/bin/bash" > "$SCRIPTfile"
echo -e 'echo "create vm-data.json file for RestAPI call to Nutanix Prism Central"' >> "$SCRIPTfile"
chmod +x "$SCRIPTfile"
for v in ${vmdata_vals[@]}
do
  if [[ $v != "USERdata_b64" ]]
  then
    echo "echo -e \"\t{{$v}}: \"""'"${!v}"'" >> "$SCRIPTfile"
  else
    echo "echo -e \"\t{{$v}}: from user-data\"" >> "$SCRIPTfile"
  fi
  echo "$SEDcmd 's|{{$v}}|${!v}|g' $DATAfile" >> "$SCRIPTfile"
done
"$SCRIPTfile"


echo -e "\ncreate script file to process request to Nutanix Prism Central"
SCRIPTfile="$DIRoutput/pc-vm-create.sh"
PClogin=$(echo "$PCuser:$PCpasswd" | tr -d '[:space:]' | openssl base64 | tr -d '[:space:]')
PCurl_login="'https://$PCaddress:9440/PrismGateway/services/rest/v3/cluster'"
PCurl_vmcreate="'https://$PCaddress:9440/api/nutanix/v3/vms'"
PCheader_auth="'Authorization: Basic $PClogin'"
PCcookie="pc-data.cookie"
PCreq_vmcreate="'$(cat $DIRoutput/vm-data.json)'"

echo -n "
curl -c $PCcookie -X 'GET' -k $PCurl_login -H 'Content-Type: application/json' -H $PCheader_auth
curl -b $PCcookie -X 'POST' -k $PCurl_vmcreate -H 'accept: application/json' -H 'Content-Type: application/json' -d $PCreq_vmcreate
" > $SCRIPTfile

echo -e "\n\n script file created - $SCRIPTfile"
echo "------------------------------------------------------------"
cat $SCRIPTfile
echo "------------------------------------------------------------"
echo -e "\ndone. bye"