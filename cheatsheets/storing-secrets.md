```bash
vault write secret/hello value=world

# json from stdin
echo -n '{"value":"itsasecret"}' | vault write secret/password -
echo -n "itsasecret" | vault write secret/password value=-

# json from a file
echo '{ "value": "itsasecret" }' > /tmp/data.json
vault write secret/password @/tmp/data.json
vault read -field=value secret/password

```
