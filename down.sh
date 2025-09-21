#!/usr/bin/bash

echo "🧹 Cleaning up namespace: default"

# Delete deployments
kubectl delete deployments --all -n default --ignore-not-found=true

# Delete services
kubectl delete services --all -n default --ignore-not-found=true

# Delete pods (force delete if stuck)
kubectl delete pods --all -n default --ignore-not-found=true --force --grace-period=0

# Delete configmaps
kubectl delete configmaps --all -n default --ignore-not-found=true

# Delete secrets
kubectl delete secrets --all -n default --ignore-not-found=true

# Delete persistent volume claims
kubectl delete pvc --all -n default --ignore-not-found=true

# Delete jobs
kubectl delete jobs --all -n default --ignore-not-found=true

# Delete cronjobs
kubectl delete cronjobs --all -n default --ignore-not-found=true

# Delete ingress
kubectl delete ingress --all -n default --ignore-not-found=true

# Delete service accounts
kubectl delete serviceaccounts --all -n default --ignore-not-found=true

echo "🧹 Cleaning up namespace: scaling-funicular"

# Delete deployments
kubectl delete deployments --all -n scaling-funicular --ignore-not-found=true

# Delete services
kubectl delete services --all -n scaling-funicular --ignore-not-found=true

# Delete pods (force delete if stuck)
kubectl delete pods --all -n scaling-funicular --ignore-not-found=true --force --grace-period=0

# Delete configmaps
kubectl delete configmaps --all -n scaling-funicular --ignore-not-found=true

# Delete secrets
kubectl delete secrets --all -n scaling-funicular --ignore-not-found=true

# Delete persistent volume claims
kubectl delete pvc --all -n scaling-funicular --ignore-not-found=true

# Delete jobs
kubectl delete jobs --all -n scaling-funicular --ignore-not-found=true

# Delete cronjobs
kubectl delete cronjobs --all -n scaling-funicular --ignore-not-found=true

# Delete ingress
kubectl delete ingress --all -n scaling-funicular --ignore-not-found=true

# Delete service accounts
kubectl delete serviceaccounts --all -n scaling-funicular --ignore-not-found=true
