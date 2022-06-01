provider "keycloak" {
  realm         = "master"
  client_id     = var.client_id
  client_secret = var.client_secret
  username      = var.username
  password      = var.password
  url           = var.keycloak_url
  base_path     = ""
  client_timeout = "300"
}
