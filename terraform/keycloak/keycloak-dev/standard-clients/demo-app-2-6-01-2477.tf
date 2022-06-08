data "keycloak_authentication_flow" "demo_app_2_6_01_2477_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "demo-app-2-6-01-2477" {
  source      = "github.com/bcgov/social-access-portal-terraform-modules?ref=5b4eb3f/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_name = "demo-app-2-6-01-2477"
  valid_redirect_uris = [
    "https://demo-app-2.apps.silver.devops.gov.bc.ca/*"
  ]
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
    "bcsc1"
  ]
  description                  = "Social Sector Access Portal App 1"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.demo_app_2_6_01_2477_browserflow.id
  access_type                  = "CONFIDENTIAL"
  pkce_code_challenge_method   = ""
  web_origins = [
    "https://demo-app-2.apps.silver.devops.gov.bc.ca/*",
    "+"
  ]
}
