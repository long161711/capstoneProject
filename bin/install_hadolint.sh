#!/usr/bin/env bash

#link of github repository of hadolint
HADOLINT_FILE=https://github.com/hadolint/hadolint/releases/download/v2.10.0/hadolint-Linux-x86_64

test -e ./bin/hadolint ||
  {
    #get hadolint and install it
    wget -qO ./bin/hadolint "${HADOLINT_FILE}"
    chmod +x ./bin/hadolint
  }
# pront hadolint version to ensure it intalled
echo "./bin/hadolint: $(./bin/hadolint --version)"
