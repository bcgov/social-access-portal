provider "keycloak" {
  realm         = "master"
  client_id     = "admin-cli"
  # client_secret = var.client_secret
  username      = "admin"
  password      = "admin"
  url           = var.keycloak_url
  base_path     = "/"
}
