#!/bin/bash
set -e

echo "Starting minikube..."
minikube start

echo "Enabling ingress addon..."
minikube addons enable ingress

echo "Applying manifests..."
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml

echo "Waiting for ingress to be ready..."
sleep 10

echo "Adding entry to /etc/hosts (requires sudo)..."
INGRESS_IP=$(minikube ip)
echo "$INGRESS_IP nginx.local" | sudo tee -a /etc/hosts

echo "Deployment complete. Access http://nginx.local"