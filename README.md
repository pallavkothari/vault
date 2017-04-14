# Vault

Quick app to run a [vault](https://www.vaultproject.io) server in a heroku dyno 

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)


## Setup 
```bash 
brew install vault vault-cli jq

export VAULT_APP=$(heroku info -j | jq -r '.app.name')
export VAULT_ADDR="https://${VAULT_APP}.herokuapp.com"

vault init      #### stash the output of this command in a safe place!
vault unseal    # do this step 3x with different keys
vault status

export VAULT_TOKEN=<ROOT TOKEN FROM INIT>
vault write secret/hello value=world
vault read secret/hello
```
