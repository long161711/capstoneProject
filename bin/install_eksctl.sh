#!/usr/bin/env bash

#create command for eksctl
COMMAND="eksctl"

test -e ./bin/${COMMAND} ||
    {
        #curl eksctl from githubrepository and install it
        curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C ./bin
        chmod +x ./bin/${COMMAND}
    }

echo "./bin/${COMMAND}: $(./bin/${COMMAND} version)"
