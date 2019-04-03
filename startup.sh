#!/bin/bash
PROJECT=terraform-bc8052e2
CLUSTER_NAME=cluster-1
CLOUDSDK_COMPUTE_ZONE=europe-west4-a
gcloud auth login
gcloud config set project $PROJECT
gcloud --quiet config set container/cluster $CLUSTER_NAME
gcloud config set compute/zone ${CLOUDSDK_COMPUTE_ZONE}
gcloud --quiet container clusters get-credentials $CLUSTER_NAME

rm ~/.ssh/git_rsa
gsutil cp gs://dev-machine-private/git_rsa /root/
ln -s $(pwd)/git_rsa ~/.ssh/git_rsa
chmod 0600 ~/.ssh/git_rsa

echo "done"
