#!/usr/bin/env bash

REPO=$1
VERSION=$2
usage="usage example : ./build.sh registryhost/reponame 83.0.4103.61-0ubuntu0.18.04.1"
if [ $# -lt 2 ]; then
	echo 1>&2 "$0: not enough arguments"
	exit 2
elif [ $# -gt 2 ]; then
	echo 1>&2 "$0: too many arguments"
	exit 2
fi
	echo "please provide 1 argument : chromium-browser ubuntu package version tag"

docker build -t ${REPO}:${VERSION} --build-arg VERSION=$VERSION .
