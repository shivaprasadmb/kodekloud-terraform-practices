terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.11.0"
    }
  }
}

provider "kubernetes" {
  config_path            = "/root/.kube/config"
  config_context = "kubernetes-admin@kubernetes"
} 