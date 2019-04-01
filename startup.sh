#!/bin/bash

echo $GCLOUD_SERVICE_KEY | base64 --decode -i > ${HOME}/gcloud-service-key.json

gcloud auth activate-service-account --key-file ${HOME}/gcloud-service-key.json

gcloud config set project $PROJECT

gcloud --quiet config set container/cluster $CLUSTER_NAME

gcloud config set compute/zone ${CLOUDSDK_COMPUTE_ZONE}

gcloud --quiet container clusters get-credentials $CLUSTER_NAME
