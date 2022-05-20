resource "helm_release" "keycloak" {
  name       = "keycloak"
  repository = "https://codecentric.github.io/helm-charts"
  chart      = "keycloakx"
  namespace = "b0f542-dev"

  values = [
    file("${path.module}/values.yaml")
  ]

  depends_on = [
    helm_release.postgresql,
    kubernetes_network_policy.sdpr_network_policy_internal
  ]
}