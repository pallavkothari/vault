## certs

Leaving this cheatsheet here for reference, but this won't actually work with the current deploy mechanism,
because I think this requires the vault server to *actually* be running in TLS mode, which ours does not do.
This is ok for every case except this one, because Heroku is providing and managing TLS for us, but terminates
TLS at the router. 

```bash
# enable certs
vault auth-enable cert
vault auth -methods

# generate TLS cert
brew install --force openssl
export PATH=$(brew --prefix openssl)/bin:$PATH
openssl version     ### something new like OpenSSL 1.0.2k  26 Jan 2017

mkdir certs && cd certs
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout vault.key -out vault.crt

vault write auth/cert/certs/test display_name=test certificate=@vault.crt
vault auth -method=cert -client-cert=vault.crt -client-key=vault.key
# returns: tls connection required



# curl shenanigans? unlikely but saving for another day
# openssl pkcs12 -export -inkey vault.key -in vault.crt -name test-curl -out test-curl.p12 -password pass:mysecret
# curl -k --cert test-curl.p12:mysecret $VAULT_ADDR/v1/auth/cert/login -XPOST
# {"errors":["tls connection required"]}

```