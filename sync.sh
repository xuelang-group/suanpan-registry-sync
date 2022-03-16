#!/bin/bash

REGISTRY=$1
NAMESPACE=$2
NAMES=$3
TOREGISTRY=$4
IFS=',' read -ra NAMEARR <<< "$NAMES"

for NAME in "${NAMEARR[@]}"; do
    echo "start to pull image: $REGISTRY/$NAMESPACE/$NAME"
    docker pull "$REGISTRY/$NAMESPACE/$NAME"
    echo "tag image to: $TOREGISTRY/$NAMESPACE/$NAME"
    docker tag "$REGISTRY/$NAMESPACE/$NAME" "$TOREGISTRY/$NAMESPACE/$NAME"
    echo "start to push image: $TOREGISTRY/$NAMESPACE/$NAME"
    docker push "$TOREGISTRY/$NAMESPACE/$NAME"
done
