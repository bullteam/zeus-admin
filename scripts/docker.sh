#!/bin/bash
repo=bullteam/zeus-admin:latest
if [[ ! -z $1 ]]; then
    repo=bullteam/zeus-admin:$1
fi
target=${repo}
docker build -t ${repo} .
docker tag ${repo} ${target}
docker push ${target}