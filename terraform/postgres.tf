resource "helm_release" "postgresql" {
  name       = "postgresql"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  namespace  = var.KUBE_NAMESPACE

  values = [
    templatefile("${path.module}/db-values.yaml",
      {
        DB_DATABASE      = var.DB_DATABASE,
        DB_PORT          = var.DB_PORT,
        DB_ROOT_PASSWORD = var.DB_ROOT_PASSWORD,
        DB_USER_USERNAME = var.DB_USER_USERNAME,
        DB_USER_PASSWORD = var.DB_USER_PASSWORD
      }
    )
  ]
}