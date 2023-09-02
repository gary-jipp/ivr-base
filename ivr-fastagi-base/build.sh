#! /bin/bash

DIR=`dirname $0`
podman build -t ivr-fastagi-base -f=$DIR/Dockerfile