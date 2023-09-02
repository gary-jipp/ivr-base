#! /bin/bash

DIR=`dirname $0`
podman build -t ivr-asterisk-base -f=$DIR/Dockerfile