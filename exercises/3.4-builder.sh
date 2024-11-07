#!/bin/sh

GH_REPO=$1
APP_NAME=`echo $1 | sed 's:.*/::'`
DH_REPO=$2

git clone https://github.com/${GH_REPO}.git
docker build $APP_NAME -t $APP_NAME
docker tag ${APP_NAME}:latest ${DH_REPO}/${APP_NAME}:latest
docker login -u $DOCKER_USER -p $DOCKER_PWD
docker push ${DH_REPO}/${APP_NAME}:latest
