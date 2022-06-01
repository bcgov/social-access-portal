resource "kubernetes_secret" "artifactory_creds" {
  metadata {
    name = "artifactory-creds"
    namespace = var.KUBE_NAMESPACE
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${var.KEYCLOAK_REGISTRY_URL}" = {
          "username" = var.KEYCLOAK_REGISTRY_USERNAME
          "password" = var.KEYCLOAK_REGISTRY_API_KEY
          "auth"     = base64encode("${var.KEYCLOAK_REGISTRY_USERNAME}:${var.KEYCLOAK_REGISTRY_API_KEY}")
        }
      }
    })
  }
}
