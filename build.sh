#!/bin/bash

GITHUBTOKEN=$1
IMAGES=$2

curl --location --request POST 'https://api.github.com/repos/xuelang-group/suanpan-registry-sync/dispatches' \
--header 'Accept: application/vnd.github.v3+json' \
--header 'Authorization: token '$GITHUBTOKEN'' \
--header 'Content-Type: application/json' \
--data-raw '{
    "event_type": "sync_image",
    "client_payload": {
        "registry": "registry.cn-shanghai.aliyuncs.com",
        "namespace": "shuzhi-amd64",
        "names": "'$IMAGES'"
    }
}'