variable "kube_config" {
  type    = string
  default = "./kubeconfig.yaml"
}
variable "namespace" {
  type    = string
  default = "monitoring"
}
variable "kube-version" {
}
