#!/bin/bash -x



export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN=$( jq -r '.root_token' data.json)

vault secrets enable ad

vault write ad/config binddn=vagrant bindpass=vagrant url=ldaps://WindowsDC.marti.local:10636 userdn='dc=marti,dc=local'

vault write ad/roles/my-application service_account_name="Martin@marti.local" ttl=5h

vault write ad/roles/my-application2 service_account_name="Martin@marti.local" ttl=5h

curl --header "X-Vault-Token: $VAULT_TOKEN" --request GET   http://127.0.0.1:8200/v1/ad/roles/my-application | jq 
curl  --header "X-Vault-Token: $VAULT_TOKEN" --request GET   http://127.0.0.1:8200/v1/ad/roles/my-application2 | jq 

#read credentials for role 

curl --header "X-Vault-Token: $VAULT_TOKEN"  --request GET  http://127.0.0.1:8200/v1/ad/creds/my-application | jq 


curl --header "X-Vault-Token: $VAULT_TOKEN" --request GET   http://127.0.0.1:8200/v1/ad/roles/my-application | jq
curl  --header "X-Vault-Token: $VAULT_TOKEN" --request GET   http://127.0.0.1:8200/v1/ad/roles/my-application2 | jq
