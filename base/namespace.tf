provider "kubeterraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.6.1"
    }
  }
}

provider "kubernetes" {
  kubeconfig = "/Users/rnayak/.kube/config"
  context    = "k3d-flux-test"
}

variable "namespace_name" {
  description = "Name of the Kubernetes namespace to create"
  type        = string
  default     = "flux-created-ns"
}

resource "kubernetes_namespace" "example_namespace" {
  metadata {
    name = var.namespace_name
  }
}