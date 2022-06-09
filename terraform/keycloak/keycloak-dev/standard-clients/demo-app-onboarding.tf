data "keycloak_authentication_flow" "demo_app_onboarding_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}


module "demo-app-onboarding" {
  source      = "github.com/bcgov/social-access-portal-terraform-modules?ref=45e6254/modules/standard-client"
  realm_id    = var.standard_realm_id
  bcsc_realm_name  = var.bcsc_realm_name
  bcsc_realm_id  = var.bcsc_realm_id
  standard_realm_id = var.standard_realm_id
  standard_realm_name = var.standard_realm_name
  keycloak_url = var.keycloak_url
  bcsc_keycloak_url = var.bcsc_keycloak_url
  bcsc_idp_alias = "bcsconboarding"
  bcsc_client_id = var.bcsc_app_1_client_id
  bcsc_client_secret = var.bcsc_app_1_client_secret

  idp_redirector_execution_id = var.idp_redirector_execution_id

  client_name = "demo-app-onboarding"
  valid_redirect_uris = [
    "https://demo-app-1.apps.silver.devops.gov.bc.ca/*",
  ]
  implicit_flow_enabled               = true
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "idir",
    "bceidbasic",
    "bceidbusiness",
    "bceidboth",
    "common",
    "bcsc"
  ]
  description                  = "Social Sector Access Portal App to demo onboarding"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.demo_app_onboarding_browserflow.id
  access_type                  = "CONFIDENTIAL"
  pkce_code_challenge_method   = ""
  web_origins = [
    "https://demo-app-1.apps.silver.devops.gov.bc.ca/*",
    "+"
  ]
}
