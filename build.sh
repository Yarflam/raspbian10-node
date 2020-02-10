#!/bin/bash
export DOCKER_CLI_EXPERIMENTAL=enabled
docker buildx build --platform linux/arm/v7 -t yarflam/raspbian10-node .
docker push yarflam/raspbian10-node
