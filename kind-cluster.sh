#!/bin/bash

# Define the cluster name and kubeconfig file path
CLUSTER_NAME="mimi-kind-cluster"


# Create a Kind cluster
kind create cluster --name "$CLUSTER_NAME"


echo "Kind cluster '$CLUSTER_NAME' deployed successfully."
