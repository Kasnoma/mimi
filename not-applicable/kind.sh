#!/bin/bash

# Set the desired cluster name
CLUSTER_NAME="mimi-cluster"

# Check if kind is installed
if ! command -v kind &> /dev/null; then
  echo "kind is not installed. Please install kind: https://kind.sigs.k8s.io/docs/user/quick-start/"
  exit 1
fi

# Create a kind cluster
kind create cluster --name "$CLUSTER_NAME"

# Set kubectl context to the newly created cluster
kubectl config use-context "$CLUSTER_NAME"

# Verify the cluster status
kubectl cluster-info