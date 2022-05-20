resource "helm_release" "postgresql" {
  name       = "postgresql"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  namespace = "b0f542-dev"

  values = [
    file("${path.module}/db-values.yaml")
  ]
}