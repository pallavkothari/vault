#!/bin/bash

readonly PORT=${PORT:?}

if [[ -z ${VAULT_UNSEAL_KEY+x} ]]; then
    echo "unseal key not provided -- vault needs to be manually unsealed"
    exit 0
fi

generate_post_data() {
cat <<EOF
    {"key": "${VAULT_UNSEAL_KEY}"}
EOF
}

echo "trying to unseal vault..."
FIRST=1

while true
do
  STATUS=$(curl -s -o /dev/null -w '%{http_code}' http://127.0.0.1:8080)
  echo "status = ${STATUS}"
  if [ ${STATUS} -eq 404 ]; then
    echo "listener is up"
	curl -X PUT -d "$(generate_post_data)" http://127.0.0.1:${PORT:?}/v1/sys/unseal
	echo "done unsealing"
    break
  else
    if [ ${FIRST} -eq 1 ]; then
        echo "waiting for listener..."
        FIRST=0
    fi
    echo -n "."
  fi
  sleep 1
done
