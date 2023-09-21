#!/bin/bash
kind create cluster --name mimi-cluster

touch kube-config-$HOME/.kube/my-kind-cluster-config
