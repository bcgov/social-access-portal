provider "keycloak" {
  realm         = "master"
  client_id     = "admin-cli"
  # client_secret = var.client_secret
  username      = "admin"
  password      = var.password
  url           = var.keycloak_url
  base_path     = ""
  client_timeout = "300"
}
