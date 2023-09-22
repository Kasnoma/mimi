provider "helm" {
  kubernetes {
    config_path = "./kubeconfig.yaml"
  }
}

# Used to interact with the resources supported by Kubernetes.
# The provider needs to be configured with the proper credentials before it can be used.
provider "kubernetes" {
  config_path = "./kubeconfig.yaml"
}
