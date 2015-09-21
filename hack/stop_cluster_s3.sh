#!/usr/bin/env sh

PROJECT_HOME="$(cd "$(dirname "$0")"/..; pwd)"

. $PROJECT_HOME/hack/set-default.sh

docker ps | grep $IMAGE | awk '{print $1}' | xargs docker rm -f
