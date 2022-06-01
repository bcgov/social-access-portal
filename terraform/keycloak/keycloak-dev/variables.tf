variable "client_id" {
  description = "The client_id for the Keycloak client in Master Realm"
  default     = "admin-cli"
}

variable "client_secret" {
  description = "The client_secret for the Keycloak client"
  default     = ""
}

variable "username" {
  description = "The username of the user used by the provider for authentication via the password grant"
  default="admin"
}

variable "password" {
  description = "The password of the user used by the provider for authentication via the password grant"
  default="admin"
}

variable "keycloak_url" {
  description = "The URL of the Keycloak instance"
  default     = "http://localhost:8080"
}

variable "azureidir_keycloak_url" {
  default = "https://login.microsoftonline.com/abcde/oauth2/v2.0"
}

variable "bcsc_keycloak_url" {
  default = "https://idtest.gov.bc.ca"
}


variable "siteminder_signing_certificate" {
  type      = string
  sensitive = true
}
