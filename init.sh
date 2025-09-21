#!/usr/bin/bash

# Create the namespace if it doesn't exist
kubectl create namespace scaling-funicular --dry-run=client -o yaml | kubectl apply -f -

# Apply deployments and services to the namespace
kubectl apply -f kubernetes/deployments/ -n scaling-funicular
kubectl apply -f kubernetes/services/ -n scaling-funicular

# Get the service URL
minikube service nginx-service --url -n scaling-funicular
