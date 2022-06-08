data "keycloak_authentication_flow" "demo_testing_5_16_3644_browserflow" {
  realm_id = var.standard_realm_id
  alias    = "idp stopper"
}
module "demo-testing-5-16-3644" {
  source      = "github.com/bcgov/social-access-portal-terraform-modules?ref=96b32ed/modules/standard-client"
  realm_id    = var.standard_realm_id
  client_name = "demo-testing-5-16-3644"
  valid_redirect_uris = [
    "http://localhost:3000*"
  ]
  access_token_lifespan               = ""
  client_session_idle_timeout         = ""
  client_session_max_lifespan         = ""
  client_offline_session_idle_timeout = ""
  client_offline_session_max_lifespan = ""
  idps = [
    "IDIR",
    "BCeID (Basic)",
    "BCeID (Business)",
    "BCeID (Basic + Business)",
    "common",
    "BCSC1"
  ]
  description                  = "CSS App"
  override_authentication_flow = true
  browser_authentication_flow  = data.keycloak_authentication_flow.demo_testing_5_16_3644_browserflow.id
  access_type                  = "PUBLIC"
  pkce_code_challenge_method   = "S256"
  web_origins = [
    "http://localhost:3000",
    "+"
  ]
}
