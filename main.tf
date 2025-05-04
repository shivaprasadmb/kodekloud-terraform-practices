resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "frontend"
    labels = {
      name = "frontend"
    }
  }

  spec {
    replicas = 4

    selector {
      match_labels = {
        name = "webapp"
      }
    }

    template {
      metadata {
        labels = {
          name = "webapp"
        }
      }

      spec {
        container {
          image = "kodekloud/webapp-color:v1"
          name  = "simple-webapp"
          port {
            container_port = 8080
      }
    }
  }
}
}
}


resource "kubernetes_service" "webapp-service" {
  depends_on = [kubernetes_deployment.frontend]
  metadata {
    name = "webapp-service"
  }
  spec {
    selector = {
      name = kubernetes_deployment.frontend.spec[0].selector[0].match_labels.name
    }
    port {
      port        = 8080
      node_port = 30080

    }

    type = "NodePort"
  }
}