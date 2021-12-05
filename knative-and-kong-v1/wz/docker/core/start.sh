#!/bin/sh
set -e

echo "--------- Winzana Core   ---------"
echo " "

if [[ "$NODE_ENV" == "development" ]]; then
    yarn start
fi
if [[ "$NODE_ENV" == "production" ]]; then
    node dist/apps/core/main.js
fi
