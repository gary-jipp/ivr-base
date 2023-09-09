#! /bin/bash

DIR=`dirname $0`

echo
echo "Building ivr-fastagi-base"
podman build --squash -t ivr-fastagi-base -f=$DIR/ivr-fastagi-base/Dockerfile

echo
echo "Building ivr-asterisk-base"
podman build --squash -t ivr-asterisk-base -f=$DIR/ivr-asterisk-base/Dockerfile
