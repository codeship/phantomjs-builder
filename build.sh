#!/usr/bin/env bash
set -e

docker build -t codeship/phantomjs-builder .
docker rm codeship-phantomjs-builder || echo no container to remove
docker create --name codeship-phantomjs-builder codeship/phantomjs-builder
docker cp codeship-phantomjs-builder:/app/phantomjs/bin/phantomjs ./phantomjs-2.0.0-ubuntu-wily-linux-x86_64

echo "Binary phantomjs now available in the current directory"
