# Vault

Quick app to run a [vault](https://www.vaultproject.io) server in a heroku dyno 

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)


## Setup 
```bash 
psql $(heroku config:get DATABASE_URL) -q -f vault-kv.sql

brew install vault vault-cli

export VAULT_ADDR='https://<your-vault>.herokuapp.com'
vault init

```


## Environment variables
- VAULT-UNSEAL_KEY optional; to automatically unseal the vault on restarts. 

