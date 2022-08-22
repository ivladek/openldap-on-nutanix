# Ubuntu VM automated deployment with OpenLDAP inside over Nutanix Prism Central

Deploying the Nutanix platform for my client this month, I was the need a connection to the global catalog. Due to security restrictions there was no connectivity to the corporate network. Also customer's IT staff did not have enough skills to deploy and maintain any global catalog, be it Active Directory or something else.
As a result, I wrote script for deployment of VM with Ubuntu, using Nutanix RestAPI, and install OpenLDAP inside it using cloud-Init. All code are available on my GitHub absolutely for free.
So. The task statement is - based on input data, generate script for fully automated deployment VM with OpenLDAP.
Input data are place in plain text file as shown bellow. Some of this data should be collected from Nutanix Prism Central (PC) and Prism Element (PE):
to get cluster name and uuid - ssh to Nutanix PC VIP and use
ncli multicluster get-cluster-state
to get image uuid - ssh to Nutanix PE VIP and use
acli image.list
to get network name and uuid - ssh to Nutanix PE VIP and use
acli image.list
Please note. You must use the network with IP Address Management. This is important because you could not pass the static IP via user-data part of cloud-init. The meta-data are prepared by Nutanix PC internally and based on data defined in IPAM for the network. Of course you can use DHCP to assign address to VM, but I think this is not so good for LDAP server.
