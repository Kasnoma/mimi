#!/bin/bash

# Define the cluster name and kubeconfig file path
CLUSTER_NAME="mimi-kind-cluster"
KUBECONFIG_FILE="$HOME/.kube/my-kind-cluster-config"

# Create a Kind cluster
kind create cluster --name "$CLUSTER_NAME"

# Export the kubeconfig for the Kind cluster
kind get kubeconfig --name "$CLUSTER_NAME" > "$KUBECONFIG_FILE"

echo "Kind cluster '$CLUSTER_NAME' deployed successfully."
echo "Kubeconfig saved to '$KUBECONFIG_FILE'. You can now use 'kubectl' to interact with the cluster."
