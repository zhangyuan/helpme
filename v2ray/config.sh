#! /bin/bash

set -e

CLIENT_ID=$(python -c 'import uuid; print(str(uuid.uuid1()))')

cp config/v2ray.example.json config/v2ray.json
cp config/mkcp.example.json config/mkcp.json

if [ "$(uname)" == 'Darwin' ]
then
  sed -i '' "s/00000000000000000000/${CLIENT_ID}/g" config/v2ray.json
  sed -i '' "s/00000000000000000000/${CLIENT_ID}/g" config/mkcp.json
else
  sed -i "s/00000000000000000000/${CLIENT_ID}/g" config/v2ray.json
  sed -i "s/00000000000000000000/${CLIENT_ID}/g" config/mkcp.json
fi

echo -e "CLIENT_ID: ${CLIENT_ID}"