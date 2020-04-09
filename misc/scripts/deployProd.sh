#!/bin/sh

GOOGLE_APPLICATION_CREDENTIALS=$1
GCP_REGION=$2
GCP_PROJECT=$3
CREDENTIALS=$4

gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS
gcloud container clusters get-credentials my-gke-cluster --region $GCP_REGION --project $GCP_PROJECT
kubectl delete secret credentials && kubectl create secret generic credentials --from-env-file $CREDENTIALS
kubectl delete deployment springboot-production && kubectl create -f kubernetes/lb/deployment-production.yml
kubectl delete deployment springboot-canary && kubectl create -f kubernetes/lb/deployment-canary.yml
kubectl delete service --ignore-not-found=true springboot-service && kubectl create -f kubernetes/lb/service.yml
