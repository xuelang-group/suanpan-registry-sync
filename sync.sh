#!/bin/bash

REGISTRY=$1
NAME=$2
TOREGISTRY=$3

echo "start to pull image: $REGISTRY/$NAME"
docker pull "$REGISTRY/$NAME"
echo "tag image to: $TOREGISTRY/$NAME"
docker tag "$REGISTRY/$NAME" "$TOREGISTRY/$NAME"
echo "start to push image: $TOREGISTRY/$NAME"
docker push "$TOREGISTRY/$NAME"
