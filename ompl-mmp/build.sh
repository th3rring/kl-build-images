#!/bin/bash

# Because this image depends on a private version of OMPL
# use this script to build it locally.

TAG='ompl-mmp'

git submodule update --init --recursive
docker build -t th3rring/builder:$TAG .
# Need to run "docker run" before.
docker push th3rring/builder:$TAG

