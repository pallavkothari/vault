#!/bin/bash 

set -e 

cat << EOF
disable_mlock = true

storage "postgresql" {
  connection_url = "${DATABASE_URL:?}"
}

listener "tcp" {
 address = "127.0.0.1:8080"
 tls_disable = 1
}

EOF


