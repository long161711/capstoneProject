#!/usr/bin/env bash

OS=$(uname | tr "[:upper:]" "[:lower:]")
COMMAND="kubectl"



test -e ./bin/${COMMAND} ||
    {
        # curl and intsall kubectl for system
        curl -sSLo ./bin/${COMMAND} "https://dl.k8s.io/release/$(curl -L -s \
            https://dl.k8s.io/release/stable.txt)/bin/${OS}/amd64/kubectl"
        chmod +x ./bin/${COMMAND}
    }

#print version of kubectl to ensure it installed
echo "./bin/${COMMAND}: $(./bin/${COMMAND} version --client)"
