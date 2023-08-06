#!/bin/bash
unset http_proxy https_proxy no_proxy
unset HTTP_PROXY HTTPS_PROXY NO_PROXY
assumrole=$(aws sts assume-role \
        --duration-seconds 3600 \
        --role-arn arn:aws:iam::xxxxxx:role/xxxx-stg-usermng-deveks-role-001 \
        --role-session-name aws-infra-cli \
        --endpoint-url https://sts.ap-northeast-1.amazonaws.com)
AWS_ACCESS_KEY_ID=$(jq -r '.Credentials.AccessKeyId' <<< ${assumrole})
echo $AWS_ACCESS_KEY_ID
export AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY=$(jq -r '.Credentials.SecretAccessKey' <<< ${assumrole})
echo $AWS_SECRET_ACCESS_KEY
export AWS_SECRET_ACCESS_KEY
AWS_SESSION_TOKEN=$(jq -r '.Credentials.SessionToken' <<< ${assumrole})
echo $AWS_SESSION_TOKEN
export AWS_SESSION_TOKEN
export PATH=$HOME/.gloo/bin:$PATH
echo 'Done'
bash