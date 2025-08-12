#!/usr/bin/env bash
set -e
: "${PORT:=3000}"
mkdir -p meshcentral-data
cat > meshcentral-data/config.json <<EOF
{
  "settings": {
    "Port": $PORT,
    "RedirPort": 0,
    "TlsOffload": true,
    "WANonly": true,
    "SelfUpdate": true,
    "SessionKey": "$(head -c 32 /dev/urandom | base64)"
  },
  "domains": {
    "": {
      "Title": "KIREI Control",
      "NewAccounts": false
    }
  }
}
EOF
node node_modules/meshcentral
