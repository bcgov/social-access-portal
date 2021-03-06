locals {
  standard_realm_name                   = "standard"
  idir_realm_name                       = "idir"
  azureidir_realm_name                  = "azureidir"
  bceidbasic_realm_name                 = "bceidbasic"
  bceidbusiness_realm_name              = "bceidbusiness"
  bceidboth_realm_name                  = "bceidboth"
  bcsc_realm_name                       = "bcsc1"
  bcsc_idp_alias                        = "bcsc"
  siteminder_single_sign_on_service_url = "https://sfstest7.gov.bc.ca/affwebservices/public/saml2sso"
  idir_idp_display_name                 = "IDIR"
  azureidir_idp_display_name            = "Azure IDIR"
  bceidbasic_idp_display_name           = "BCeID (Basic)"
  bceidbusiness_idp_display_name        = "BCeID (Business)"
  bceidboth_idp_display_name            = "BCeID (Basic + Business)"
  bcsc_idp_display_name                 = "BCSC"
}

module "standard" {
  source       = "github.com/bcgov/social-access-portal-terraform-modules?ref=3dd8cd5/modules/base-realms/realm-standard"
  keycloak_url = var.keycloak_url

  standard_realm_name      = local.standard_realm_name
  idir_realm_name          = local.idir_realm_name
  azureidir_realm_name     = local.azureidir_realm_name
  bceidbasic_realm_name    = local.bceidbasic_realm_name
  bceidbusiness_realm_name = local.bceidbusiness_realm_name
  bceidboth_realm_name     = local.bceidboth_realm_name
  bcsc_realm_name          = local.bcsc_realm_name

  idir_idp_display_name          = local.idir_idp_display_name
  azureidir_idp_display_name     = local.azureidir_idp_display_name
  bceidbasic_idp_display_name    = local.bceidbasic_idp_display_name
  bceidbusiness_idp_display_name = local.bceidbusiness_idp_display_name
  bceidboth_idp_display_name     = local.bceidboth_idp_display_name

  idir_client_id              = module.idir.standard_client_id
  idir_client_secret          = module.idir.standard_client_secret
  azureidir_client_id         = module.azureidir.standard_client_id
  azureidir_client_secret     = module.azureidir.standard_client_secret
  bceidbasic_client_id        = module.bceidbasic.standard_client_id
  bceidbasic_client_secret    = module.bceidbasic.standard_client_secret
  bceidbusiness_client_id     = module.bceidbusiness.standard_client_id
  bceidbusiness_client_secret = module.bceidbusiness.standard_client_secret
  bceidboth_client_id         = module.bceidboth.standard_client_id
  bceidboth_client_secret     = module.bceidboth.standard_client_secret
}

module "idir" {
  source                     = "github.com/bcgov/social-access-portal-terraform-modules?ref=3dd8cd5/modules/base-realms/realm-idir"
  keycloak_url               = var.keycloak_url
  realm_name                 = local.idir_realm_name
  standard_realm_name        = local.standard_realm_name
  saml_entity_id             = "https://dev.loginproxy.gov.bc.ca/auth/realms/_idir/"
  single_sign_on_service_url = local.siteminder_single_sign_on_service_url
  signing_certificate        = var.siteminder_signing_certificate
}

module "azureidir" {
  source                 = "github.com/bcgov/social-access-portal-terraform-modules?ref=3dd8cd5/modules/base-realms/realm-azureidir"
  keycloak_url           = var.keycloak_url
  realm_name             = local.azureidir_realm_name
  standard_realm_name    = local.standard_realm_name
  azureidir_keycloak_url = var.azureidir_keycloak_url

  depends_on = [
    module.idir
  ]
}

module "bcsc" {
  source                 = "github.com/bcgov/social-access-portal-terraform-modules?ref=3dd8cd5/modules/base-realms/realm-bcsc"
  keycloak_url           = var.keycloak_url
  realm_name             = local.bcsc_realm_name

  depends_on = [
    module.azureidir
  ]
}

module "bceidbasic" {
  source                     = "github.com/bcgov/social-access-portal-terraform-modules?ref=3dd8cd5/modules/base-realms/realm-bceidbasic"
  keycloak_url               = var.keycloak_url
  realm_name                 = local.bceidbasic_realm_name
  standard_realm_name        = local.standard_realm_name
  saml_entity_id             = "https://dev.loginproxy.gov.bc.ca/auth/realms/_bceidbasic/"
  single_sign_on_service_url = local.siteminder_single_sign_on_service_url
  signing_certificate        = var.siteminder_signing_certificate

  depends_on = [
    module.bcsc
  ]

}


module "bceidbusiness" {
  source                     = "github.com/bcgov/social-access-portal-terraform-modules?ref=3dd8cd5/modules/base-realms/realm-bceidbusiness"
  keycloak_url               = var.keycloak_url
  realm_name                 = local.bceidbusiness_realm_name
  standard_realm_name        = local.standard_realm_name
  saml_entity_id             = "https://dev.loginproxy.gov.bc.ca/auth/realms/_bceidbusiness/"
  single_sign_on_service_url = local.siteminder_single_sign_on_service_url
  signing_certificate        = var.siteminder_signing_certificate

  depends_on = [
    module.bceidbasic
  ]

}

module "bceidboth" {
  source                     = "github.com/bcgov/social-access-portal-terraform-modules?ref=3dd8cd5/modules/base-realms/realm-bceidboth"
  keycloak_url               = var.keycloak_url
  realm_name                 = local.bceidboth_realm_name
  standard_realm_name        = local.standard_realm_name
  saml_entity_id             = "https://dev.loginproxy.gov.bc.ca/auth/realms/_bceidbasicbusiness/"
  single_sign_on_service_url = local.siteminder_single_sign_on_service_url
  signing_certificate        = var.siteminder_signing_certificate
  depends_on = [
    module.bceidbusiness
  ]
}

module "standard_clients" {
  source            = "./standard-clients"
  standard_realm_id = module.standard.realm_id
  bcsc_realm_id     = module.bcsc.realm_id
  standard_realm_name = local.standard_realm_name
  bcsc_realm_name = local.bcsc_realm_name

  keycloak_url               = var.keycloak_url

  bcsc_app_1_client_id         = var.bcsc_app_1_client_id
  bcsc_app_1_client_secret     = var.bcsc_app_1_client_secret
  bcsc_app_2_client_id         = var.bcsc_app_2_client_id
  bcsc_app_2_client_secret     = var.bcsc_app_2_client_secret
  bcsc_keycloak_url            = var.bcsc_keycloak_url
  idp_redirector_execution_id  = module.bcsc.idp_redirector_execution_id
  bcsc_idp_display_name        = local.bcsc_idp_display_name

}

module "master_idir_link" {
  source           = "github.com/bcgov/social-access-portal-terraform-modules?ref=3dd8cd5/modules/master-idp-link"
  keycloak_url     = var.keycloak_url
  idp_realm_id     = module.idir.realm_id
  idp_realm_name   = module.idir.realm_name
  idp_public_attrs = ["display_name", "idir_user_guid", "idir_username"]
}

module "master_viewer_role" {
  source      = "github.com/bcgov/social-access-portal-terraform-modules?ref=3dd8cd5/modules/master-viewer-role"
  realm_names = ["master", "standard", "idir", "azureidir", "bceidbasic", "bceidbusiness", "bceidboth"]

  depends_on = [
    module.standard,
    module.idir,
    module.azureidir,
    module.bceidbasic,
    module.bceidbusiness,
    module.bceidboth,
  ]
}
