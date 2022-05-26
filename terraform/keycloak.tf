resource "helm_release" "keycloak" {
  name       = "keycloak"
  repository = "https://codecentric.github.io/helm-charts"
  chart      = "keycloakx"
  namespace  = var.KUBE_NAMESPACE

  values = [
    templatefile("${path.module}/values.yaml",
      {
        DB_PORT                 = var.DB_PORT,
        DB_DATABASE             = var.DB_DATABASE,
        DB_USER_USERNAME        = var.DB_USER_USERNAME,
        DB_USER_PASSWORD        = var.DB_USER_PASSWORD,
        KEYCLOAK_ADMIN_USERNAME = var.KEYCLOAK_ADMIN_USERNAME,
        KEYCLOAK_ADMIN_PASSWORD = var.KEYCLOAK_ADMIN_PASSWORD,
        HOST_DOMAIN             = var.HOST_DOMAIN,
        SUB_DOMAIN              = var.SUB_DOMAIN,
        IMAGE_TAG               = var.IMAGE_TAG
      }
    )
  ]

  depends_on = [
    helm_release.postgresql,
    kubernetes_network_policy.sdpr_network_policy_internal
  ]
}