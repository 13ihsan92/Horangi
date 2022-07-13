provider "kubernetes" {
  config_path    = "C:/Users/ihsan/.kube/config"
  config_context = "docker-desktop"
  host = "https://kubernetes.docker.internal:6443"
}

resource "kubernetes_namespace" "api-ns" {
  metadata {
    name = "api-ns"
  }
}