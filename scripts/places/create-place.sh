#!/bin/bash

curl "http://localhost:4741/places" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "place": {
      "name": "'"${NAME}"'",
      "address": "'"${ADDRESS}"'",
      "description": "'"${DESC}"'"
    }
  }'

echo