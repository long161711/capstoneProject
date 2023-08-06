#!/usr/bin/env bash

CONTAINER_NAME="longnt2/capstone-app"
VERSION=1.0
CONTAINER_PORT=80
HOST_PORT=80

# Run docker container with container name "longnt2/capstone-app"
docker run -t --rm -p ${HOST_PORT}:${CONTAINER_PORT} ${CONTAINER_NAME}:${VERSION}
