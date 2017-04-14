## tokens

```bash
# set up the required policies first
vault policy-write readonly readonly-policy.hcl

# using the cli
vault token-create -policy="readonly" -ttl="1h" -renewable=true -use-limit=3
vault token-create -policy="readonly" -ttl="1h" -renewable=true -use-limit=3 -format=json | jq -r '.auth.client_token'



# create a token using the rest API
curl -X POST -H "X-Vault-Token: ${VAULT_TOKEN}" https://${VAULT_APP}.herokuapp.com/v1/auth/token/create

# list current token accessors
curl -H "X-Vault-Token: ${VAULT_TOKEN}" https://${VAULT_APP}.herokuapp.com/v1/auth/token/accessors\?list\=true

```