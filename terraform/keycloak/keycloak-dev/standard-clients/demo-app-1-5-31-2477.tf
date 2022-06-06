data "keycloak_authentication_flow" "demo_app_1_5_31_2477_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "demo-app-1-5-31-2477" {
  source      = "github.com/bcgov/social-access-portal-terraform-modules?ref=5209238/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_name = "demo-app-1-5-31-2477"
  valid_redirect_uris = [
    "https://demo-app-1.apps.silver.devops.gov.bc.ca/*",
    "http://localhost:3002"
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
    "bcsc1"
  ]
  description                  = "Social Sector Access Portal App 1"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.demo_testing_5_16_3644_browserflow.id
  access_type                  = "CONFIDENTIAL"
  pkce_code_challenge_method   = ""
  web_origins = [
    "https://demo-app-1.apps.silver.devops.gov.bc.ca/*",
    "http://localhost:3002",
    "+"
  ]
}
