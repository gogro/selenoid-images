#!/usr/bin/env bash

VERSION=$1
if [[ -z "$1" ]]; then
    echo "please provide 1 argument : chromium-browser ubuntu package version tag"
    exit 2
fi

docker build -t selenoid/chromium:${VERSION} --build-arg VERSION=$VERSION .
