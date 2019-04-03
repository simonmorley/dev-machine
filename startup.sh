#!/bin/bash
PROJECT=terraform-bc8052e2
CLUSTER_NAME=cluster-1
CLOUDSDK_COMPUTE_ZONE=europe-west4-a
gcloud auth login
gcloud config set project $PROJECT
gcloud --quiet config set container/cluster $CLUSTER_NAME
gcloud config set compute/zone ${CLOUDSDK_COMPUTE_ZONE}
gcloud --quiet container clusters get-credentials $CLUSTER_NAME
echo "done"
