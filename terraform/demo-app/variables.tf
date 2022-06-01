# ------------ Image Pull secrets --------------------- #

variable "DOCKER_USERNAME" {
  type    = string
}

variable "DOCKER_PASSWORD" {
  type      = string
  sensitive = true
}

variable "DOCKER_SERVER" {
  type    = string
  default = "https://index.docker.io/v1/"
}

variable "DOCKER_EMAIL" {
  type    = string
}

variable "DOCKER_IMAGE" {
  type    = string
}

# ------------ Variables for demo apps ---------------- #

variable "KEYCLOAK_AUTHORITY" {
  type    = string
}

variable "DOMAIN" {
  type = string
  default = "apps.silver.devops.gov.bc.ca"
}

variable "NAMESPACE" {
  type = string
  default = "b0f542-dev"
}

# ----------- Variables for demo app 1 ------------------ #

variable "APP_1_KEYCLOAK_CLIENT_ID" {
  type    = string
}

variable "APP_1_KEYCLOAK_CLIENT_SECRET" {
  type      = string
  sensitive = true
}

variable "APP_1_NAME" {
  type    = string
  default = "ssag-demo-app-1"
}

variable "APP_1_TITLE" {
  type    = string
  default = "Demo App 1"
}

variable "APP_1_SUBDOMAIN" {
  type    = string
  default = "demo-app-1"
}

variable "APP_1_LABEL" {
  type = string
  default = "SSAGdemoApp1"
}

# ----------- Variables for demo app 2 ------------------ #

variable "APP_2_KEYCLOAK_CLIENT_ID" {
  type    = string
}

variable "APP_2_KEYCLOAK_CLIENT_SECRET" {
  type      = string
  sensitive = true
}

variable "APP_2_NAME" {
  type    = string
  default = "ssag-demo-app-2"
}

variable "APP_2_TITLE" {
  type    = string
  default = "Demo App 2"
}

variable "APP_2_SUBDOMAIN" {
  type    = string
  default = "demo-app-2"
}

variable "APP_2_LABEL" {
  type = string
  default = "SSAGdemoApp2"
}