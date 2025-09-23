#!/usr/bin/bash

# Create the namespace if it doesn't exist
kubectl create namespace scaling-funicular --dry-run=client -o yaml | kubectl apply -f -

# building hello_world_service
cd hello_world_service || exit
docker build -t scaling-funicular/hello_world_service . || exit
cd ..

# applying nginx config
kubectl create configmap nginx-config --from-file=nginx.conf=./nginx.conf -n scaling-funicular --dry-run=client -o yaml | kubectl apply -f -

# Apply deployments and services to the namespace
kubectl apply -f kubernetes/deployments/ -n scaling-funicular
kubectl apply -f kubernetes/services/ -n scaling-funicular

# Waiting for services to be ready
kubectl wait --for=condition=ready pod -l app=database -n scaling-funicular --timeout=120s
echo "Database ready"

kubectl wait --for=condition=ready pod -l app=hello-world-service -n scaling-funicular --timeout=120s
echo "hello-world-service ready"

# Get the service URL
minikube service nginx-service --url -n scaling-funicular
