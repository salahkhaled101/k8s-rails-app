#!/bin/sh

# I'm resorting to this because kubectl can't figure out the correct order for resource creation.

kubectl apply -f k8s/namespaces
kubectl apply -f k8s/configmaps
kubectl apply -f k8s/secrets
kubectl apply -f k8s/persistentvolumeclaims
kubectl apply -f k8s/services
kubectl apply -f k8s/jobs
kubectl apply -f k8s/deployments
kubectl apply -f k8s/ingresses
