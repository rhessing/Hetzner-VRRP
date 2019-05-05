#!/bin/bash

TOKEN="I2zyKDx6DJou4RuCaqf2A6ernmakN5XeF0W7FEv0m8MbRx7fbahJjTpTFQUFJlmA"

SERVER_ID=$(curl -H "Authorization: Bearer $TOKEN" "https://api.hetzner.cloud/v1/servers?name=$1" | jq '.servers[0].id')
FLOATING_IP_ID=$(curl -H "Authorization: Bearer $TOKEN" "https://api.hetzner.cloud/v1/floating_ips" | jq ".floating_ips[] | select(.description==\"$2\")" | jq '.id')

curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" -d "{\"server\":$SERVER_ID}" "https://api.hetzner.cloud/v1/floating_ips/$FLOATING_IP_ID/actions/assign"
