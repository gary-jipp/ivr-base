#! /bin/bash

DIR=`dirname $0`

echo
echo "Building ivr-fastagi-base"
podman build  -t ivr-fastagi-base -f=$DIR/ivr-fastagi-base/Dockerfile

echo
echo "Building ivr-asterisk-base"
podman build  -t ivr-asterisk-base -f=$DIR/ivr-asterisk-base/Dockerfile
