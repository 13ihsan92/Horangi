resource "kubernetes_deployment_v1" "horangi-deploy" {
  metadata {
    name = "horangi-deploy"
    namespace = "api-ns"
    labels = {
      version = "1.0.0"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        version = "1.0.0"
      }
    }

    template {
      metadata {
        labels = {
          version = "1.0.0"
        }
      }

      spec {
        container {
          image = "13ihsan92/horangi-api:1.0.1"
          name  = "api-horangi"

          port {
            container_port = 3000
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 3000

              http_header {
                name  = "X-Custom-Header"
                value = "Horangi"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}