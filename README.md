This repo can be used to run Vault with Active Directory secrets engine.

# Pre-req
Vault 1.6.2
Vagrant 2.2.9
VirtualBox
Active Directory in Vagrant 

#How to use this repo


$ chmod +x start.sh

run Vault server, initialize and unseal it
$ ./start.sh

configure Active Directory secrets engine with script repro.sh

$ chmod +x repro.sh
$ ./repro.sh
