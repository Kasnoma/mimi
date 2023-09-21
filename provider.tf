terraform {
  required_version = ">= 0.13"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

provider "kubectl" {
  #config_path = "~/.kube/config"  # Path to your kubeconfig file
  config_path    = "C:/Users/MmesomaOkaro/Downloads/K8S/Myapp/kubeconfig.yaml"
  config_context = "kind-mimi-kind-cluster"
}



