resource "kubernetes_service" "api-svc" {
  metadata {
    name = "api-svc"
    namespace = "api-ns"
  }
  spec {
    selector = {
      version = kubernetes_deployment_v1.horangi-deploy.metadata.0.labels.version
    }
    port {
      port        = 3000
      target_port = 3000
      node_port = 30300
    }

    type = "NodePort"
  }
}