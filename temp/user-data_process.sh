#!/bin/bash
echo "create user-data file for cloud-init"
echo -e "\t{{VMfqdn}}: "'ldap.ivladek.com'
sed -i '' 's|{{VMfqdn}}|ldap.ivladek.com|g' output/user-data
echo -e "\t{{VMtz}}: "'Asia/Almaty'
sed -i '' 's|{{VMtz}}|Asia/Almaty|g' output/user-data
echo -e "\t{{VMuser}}: "'ldap-admin'
sed -i '' 's|{{VMuser}}|ldap-admin|g' output/user-data
echo -e "\t{{hashVMpasswd}}: "'$6$rounds=4096$sQZ38iBKkvqyouOc$k/IDmJWYFHJT57dwelzI8f2byunCaeiiVJzctj.nyEyhOU.7.Dv38yMzidKDONmXlwXvKkOqy3X1bjWcMrH/Q/'
sed -i '' 's|{{hashVMpasswd}}|$6$rounds=4096$sQZ38iBKkvqyouOc$k/IDmJWYFHJT57dwelzI8f2byunCaeiiVJzctj.nyEyhOU.7.Dv38yMzidKDONmXlwXvKkOqy3X1bjWcMrH/Q/|g' output/user-data
echo -e "\t{{LDAPcert}}: "'C=KZ, L=Almaty, O=Ivladek qPort, OU=LDAP Server, CN=ldap.ivladek.com'
sed -i '' 's|{{LDAPcert}}|C=KZ, L=Almaty, O=Ivladek qPort, OU=LDAP Server, CN=ldap.ivladek.com|g' output/user-data
echo -e "\t{{LDAPadminDN}}: "'CN=admin,DC=ivladek,DC=com'
sed -i '' 's|{{LDAPadminDN}}|CN=admin,DC=ivladek,DC=com|g' output/user-data
echo -e "\t{{fileLDAPinit}}: "'ldap-init.ldif'
sed -i '' 's|{{fileLDAPinit}}|ldap-init.ldif|g' output/user-data
echo -e "\t{{fileLDAPtls}}: "'ldap-tls.ldif'
sed -i '' 's|{{fileLDAPtls}}|ldap-tls.ldif|g' output/user-data
echo -e "\t{{fileLDAProot}}: "'ldap-root'
sed -i '' 's|{{fileLDAProot}}|ldap-root|g' output/user-data
echo -e "\t{{fileLDAPanswers1}}: "'slapd-answers1'
sed -i '' 's|{{fileLDAPanswers1}}|slapd-answers1|g' output/user-data
echo -e "\t{{fileLDAPanswers2}}: "'slapd-answers2'
sed -i '' 's|{{fileLDAPanswers2}}|slapd-answers2|g' output/user-data
echo -e "\tadd content encoded with base64"
echo -e "\t\tfileLDAPinit: from fileLDAPinit_b64"
sed -i '' 's|{{fileLDAPinit_b64}}|CkROOiBPVT11c2VycyxEQz1pdmxhZGVrLERDPWNvbQpvYmplY3RDbGFzczogb3JnYW5pemF0aW9uYWxVbml0Cm9iamVjdENsYXNzOiB0b3AKT1U6IHVzZXJzCgpETjogT1U9Z3JvdXBzLERDPWl2bGFkZWssREM9Y29tCm9iamVjdENsYXNzOiBvcmdhbml6YXRpb25hbFVuaXQKb2JqZWN0Q2xhc3M6IHRvcApPVTogZ3JvdXBzCg==|g' output/user-data
echo -e "\t\tfileLDAPtls: from fileLDAPtls_b64"
sed -i '' 's|{{fileLDAPtls_b64}}|CkROOiBDTj1jb25maWcKY2hhbmdldHlwZTogbW9kaWZ5CnJlcGxhY2U6IG9sY1RMU0NBQ2VydGlmaWNhdGVGaWxlCm9sY1RMU0NBQ2VydGlmaWNhdGVGaWxlOiAvZXRjL2xkYXAvc2FzbDIvbGRhcC5pdmxhZGVrLmNvbS5jcnQKLQpyZXBsYWNlOiBvbGNUTFNDZXJ0aWZpY2F0ZUZpbGUKb2xjVExTQ2VydGlmaWNhdGVGaWxlOiAvZXRjL2xkYXAvc2FzbDIvbGRhcC5pdmxhZGVrLmNvbS5jcnQKLQpyZXBsYWNlOiBvbGNUTFNDZXJ0aWZpY2F0ZUtleUZpbGUKb2xjVExTQ2VydGlmaWNhdGVLZXlGaWxlOiAvZXRjL2xkYXAvc2FzbDIvbGRhcC5pdmxhZGVrLmNvbS5rZXkK|g' output/user-data
echo -e "\t\tfileLDAProot: from fileLDAProot_b64"
sed -i '' 's|{{fileLDAProot_b64}}|aXZsYWRlazIwMjItUk9PVA==|g' output/user-data
echo -e "\t\tfileLDAPanswers1: from fileLDAPanswers1_b64"
sed -i '' 's|{{fileLDAPanswers1_b64}}|CnNsYXBkIHNsYXBkL3Jvb3RfcGFzc3dvcmQgcGFzc3dvcmQgaXZsYWRlazIwMjItUk9PVApzbGFwZCBzbGFwZC9yb290X3Bhc3N3b3JkX2FnYWluIHBhc3N3b3JkIGl2bGFkZWsyMDIyLVJPT1QK|g' output/user-data
echo -e "\t\tfileLDAPanswers2: from fileLDAPanswers2_b64"
sed -i '' 's|{{fileLDAPanswers2_b64}}|CnNsYXBkIHNsYXBkL2ludGVybmFsL2FkbWlucHcgcGFzc3dvcmQgaXZsYWRlazIwMjItQURNSU4Kc2xhcGQgc2xhcGQvaW50ZXJuYWwvZ2VuZXJhdGVkX2FkbWlucHcgcGFzc3dvcmQgaXZsYWRlazIwMjItQURNSU4Kc2xhcGQgc2xhcGQvcGFzc3dvcmQxIHBhc3N3b3JkIGl2bGFkZWsyMDIyLVJPT1QKc2xhcGQgc2xhcGQvcGFzc3dvcmQyIHBhc3N3b3JkIGl2bGFkZWsyMDIyLVJPT1QKc2xhcGQgc2xhcGQvZG9tYWluIHN0cmluZyBpdmxhZGVrLmNvbQpzbGFwZCBzaGFyZWQvb3JnYW5pemF0aW9uIHN0cmluZyBJdmxhZGVrIHFQb3J0CnNsYXBkIHNsYXBkL2JhY2tlbmQgc3RyaW5nIEhEQgpzbGFwZCBzbGFwZC9wdXJnZV9kYXRhYmFzZSBib29sZWFuIHRydWUKc2xhcGQgc2xhcGQvbW92ZV9vbGRfZGF0YWJhc2UgYm9vbGVhbiB0cnVlCnNsYXBkIHNsYXBkL2FsbG93X2xkYXBfdjIgYm9vbGVhbiBmYWxzZQpzbGFwZCBzbGFwZC9ub19jb25maWd1cmF0aW9uIGJvb2xlYW4gZmFsc2UK|g' output/user-data
