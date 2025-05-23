#!/bin/bash

# Apply all Kubernetes resources
kubectl apply -f mongodb/
kubectl apply -f backend/
kubectl apply -f frontend/
kubectl apply -f ingress.yaml

# Wait for deployments to be ready

echo "Waiting for MongoDB deployment..."
kubectl rollout status statefulset/mongodb

echo "Waiting for backend deployment..."
kubectl rollout status deployment/backend

echo "Waiting for frontend deployment..."
kubectl rollout status deployment/frontend

echo "Deployment complete!"
echo "To access the application, add 'telemedicine.local' to your /etc/hosts file"