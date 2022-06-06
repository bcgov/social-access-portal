# KEYCLOAK_DEV
variable "DEV_CLIENT_ID" {
  description = "The client_id for the Keycloak client in Master Realm"
  default     = "terraform-cli"
}

variable "DEV_CLIENT_SECRET" {
  description = "The client_secret for the Keycloak client"
  default     = ""
}

variable "DEV_USERNAME" {
  description = "The username of the user used by the provider for authentication via the password grant"
  default     = ""
}

variable "DEV_PASSWORD" {
  description = "The password of the user used by the provider for authentication via the password grant"
  default     = ""
}

variable "DEV_KEYCLOAK_URL" {
  description = "The URL of the Keycloak instance"
  default     = "https://social-sector-access-gateway-dev.apps.silver.devops.gov.bc.ca"
}

variable "DEV_BCSC_CLIENT_ID" {
  description = "The BCSC client id used for dev"
  sensitive = true
  type = string
}

variable "DEV_BCSC_CLIENT_SECRET" {
  description = "The BCSC client secret used for dev"
  sensitive = true
  type = string
}

# KEYCLOAK_TEST
variable "TEST_CLIENT_ID" {
  description = "The client_id for the Keycloak client in Master Realm"
  default     = "terraform-cli"
}

variable "TEST_CLIENT_SECRET" {
  description = "The client_secret for the Keycloak client"
  default     = ""
}

variable "TEST_USERNAME" {
  description = "The username of the user used by the provider for authentication via the password grant"
  default     = ""
}

variable "TEST_PASSWORD" {
  description = "The password of the user used by the provider for authentication via the password grant"
  default     = ""
}

variable "TEST_KEYCLOAK_URL" {
  description = "The URL of the Keycloak instance"
  default     = "https://test.loginproxy.gov.bc.ca"
}

# KEYCLOAK_PROD
variable "PROD_CLIENT_ID" {
  description = "The client_id for the Keycloak client in Master Realm"
  default     = "terraform-cli"
}

variable "PROD_CLIENT_SECRET" {
  description = "The client_secret for the Keycloak client"
  default     = ""
}

variable "PROD_USERNAME" {
  description = "The username of the user used by the provider for authentication via the password grant"
  default     = ""
}

variable "PROD_PASSWORD" {
  description = "The password of the user used by the provider for authentication via the password grant"
  default     = ""
}

variable "PROD_KEYCLOAK_URL" {
  description = "The URL of the Keycloak instance"
  default     = "https://loginproxy.gov.bc.ca"
}

variable "TEST_SITEMINDER_SIGNING_CERTIFICATE" {
  default = ""
  type      = string
  sensitive = true
}

variable "PROD_SITEMINDER_SIGNING_CERTIFICATE" {
  default=""
  type      = string
  sensitive = true
}
