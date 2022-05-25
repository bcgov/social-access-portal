module "keycloak_dev" {
  source = "./keycloak-dev"

  client_id                      = var.dev_client_id
  client_secret                  = var.dev_client_secret
  keycloak_url                   = var.dev_keycloak_url
  username                       = var.dev_username
  password                       = var.dev_password
  siteminder_signing_certificate = var.test_siteminder_signing_certificate
}
