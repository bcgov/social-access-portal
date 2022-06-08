module "keycloak_dev" {
  source = "./keycloak-dev"

  client_id                      = var.DEV_CLIENT_ID
  client_secret                  = var.DEV_CLIENT_SECRET
  keycloak_url                   = var.DEV_KEYCLOAK_URL
  username                       = var.DEV_USERNAME
  password                       = var.DEV_PASSWORD
  bcsc_client_id                 = var.DEV_BCSC_CLIENT_ID
  bcsc_client_secret             = var.DEV_BCSC_CLIENT_SECRET
  bcsc_app_1_client_id                 = var.DEV_BCSC_APP_1_CLIENT_ID
  bcsc_app_1_client_secret             = var.DEV_BCSC_APP_1_CLIENT_SECRET
  bcsc_app_2_client_id                 = var.DEV_BCSC_APP_2_CLIENT_ID
  bcsc_app_2_client_secret             = var.DEV_BCSC_APP_2_CLIENT_SECRET
  siteminder_signing_certificate = var.TEST_SITEMINDER_SIGNING_CERTIFICATE
}