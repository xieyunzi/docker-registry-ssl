#!/bin/sh

docker tag $1 localhost:5000/$1
docker push localhost:5000/$1

# rsync
# docker pull localhost:5000/$1
# docker tag localhost:5000/$1 $1
