resource "kubernetes_secret" "app_secret" {
  metadata {
    name      = var.APP_NAME
    namespace = var.NAMESPACE
  }

  data = {
    KEYCLOAK_AUTHORITY     = var.KEYCLOAK_AUTHORITY
    KEYCLOAK_CLIENT_ID     = var.KEYCLOAK_CLIENT_ID
    KEYCLOAK_CLIENT_SECRET = var.KEYCLOAK_CLIENT_SECRET
    APP_NAME               = var.APP_TITLE
    APP_TITLE              = var.APP_TITLE
    KEYCLOAK_REDIRECT_URI  = var.KEYCLOAK_REDIRECT_URI
  }
}

resource "kubernetes_deployment" "app_deployment" {
  metadata {
    name = var.APP_NAME
    labels = {
      test = var.APP_LABEL
    }
    namespace = var.NAMESPACE
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        test = var.APP_LABEL
      }
    }

    template {
      metadata {
        labels = {
          test = var.APP_LABEL
        }
      }

      spec {
        image_pull_secrets {
          name = var.IMAGE_PULL_SECRET_NAME
        }
        container {
          image = var.DOCKER_IMAGE
          name  = var.APP_NAME
          env_from {
            secret_ref {
              name = kubernetes_secret.app_secret.metadata[0].name
            }
          }
          resources {
            limits = {
              cpu    = "0.25"
              memory = "0m"
            }
            requests = {
              cpu    = "120m"
              memory = "0m"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "app_service" {
  metadata {
    name      = var.APP_NAME
    namespace = var.NAMESPACE
  }
  spec {
    selector = {
      test = var.APP_LABEL
    }
    session_affinity = "ClientIP"
    port {
      port        = 80
      target_port = 7170
    }
    type = "ClusterIP"
  }
}

resource "kubernetes_ingress" "app_ingress" {
  metadata {
    name      = var.APP_NAME
    namespace = var.NAMESPACE
    annotations = {
      "route.openshift.io/termination" = "edge"
    }
  }

  spec {
    backend {
      service_name = kubernetes_service.app_service.metadata[0].name
      service_port = 80
    }

    rule {
      host = "${var.APP_SUBDOMAIN}.${var.APP_DOMAIN}"
      http {
        path {
          backend {
            service_name = kubernetes_service.app_service.metadata[0].name
            service_port = 80
          }

          path = "/"
        }
      }
    }
  }
}