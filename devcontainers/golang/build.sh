#!/bin/bash

OS=$(uname -s)
case $OS in
    "Linux")
        OS="linux"
        ;;
esac

ARCHITECTURE=$(uname -m)
case $ARCHITECTURE in
    "aarch64")
        ARCHITECTURE="arm64"
        ;;
esac

GO_PACKAGE_INFO=$( \
curl -s https://go.dev/dl/?mode=json | \
jq '.[0] |
    .files[] |
    select(.os=="'$OS'" and .arch=="'$ARCHITECTURE'")' \
)

GO_PACKAGE_FILENAME=$(echo $GO_PACKAGE_INFO | jq --raw-output '.filename')
GO_VERSION=$(echo $GO_PACKAGE_INFO | jq --raw-output '.version')

IMAGE_TAG="amaic/devcontainer-golang:$GO_VERSION"
echo "Building $IMAGE_TAG (package: $GO_PACKAGE_FILENAME)"
docker build --build-arg GO_PACKAGE_FILENAME=$GO_PACKAGE_FILENAME --tag $IMAGE_TAG .
 