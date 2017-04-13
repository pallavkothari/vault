# Vault

Quick app to run a [vault](https://www.vaultproject.io) server in a heroku dyno 

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)


## Setup 
```bash 
heroku apps:create -b https://github.com/pallavkothari/heroku-buildpack-vault.git --region us -b https://github.com/pallavkothari/heroku-buildpack-nginx
heroku ps:scale web=1
```


## Environment variables
- VAULT-UNSEAL_KEY optional; to automatically unseal the vault on restarts. 

## Local usage
```bash 
brew install vault vault-cli
heroku local 
```
