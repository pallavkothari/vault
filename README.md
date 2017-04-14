# Vault

Quick app to run a [vault](https://www.vaultproject.io) server in a heroku dyno 

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)


## Setup 
```bash 
heroku ps:resize web=1:Hobby # resize to get heroku ACM 

psql $(heroku config:get DATABASE_URL) -q -f vault-kv.sql

brew install vault vault-cli

export VAULT_ADDR='https://<your-vault>.herokuapp.com'

vault init     #### stash the output of this command in a safe place!
vault unseal
vault unseal
vault unseal    # unseal with 3 keys
vault status

export VAULT_TOKEN=<ROOT TOKEN FROM INIT>
vault write secret/hello value=world
vault read secret/hello

```


## Environment variables
- VAULT-UNSEAL_KEY optional; to automatically unseal the vault on restarts. 

