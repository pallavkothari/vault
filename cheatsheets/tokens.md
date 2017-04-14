## tokens

```bash
# create a token using the rest API
curl -X POST -H "X-Vault-Token: ${VAULT_TOKEN}" https://${VAULT_APP}.herokuapp.com/v1/auth/token/create

# list current token accessors
curl -H "X-Vault-Token: ${VAULT_TOKEN}" https://${VAULT_APP}.herokuapp.com/v1/auth/token/accessors\?list\=true

```