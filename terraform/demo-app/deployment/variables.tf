
variable "NAMESPACE" {
  type = string
}

variable "KEYCLOAK_AUTHORITY" {
  type = string
}

variable "KEYCLOAK_CLIENT_ID" {
  type = string
}

variable "KEYCLOAK_CLIENT_SECRET" {
  type = string
  sensitive = true
}


variable "KEYCLOAK_REDIRECT_URI" {
  type = string
}

variable "APP_TITLE" {
  type = string
}

variable "APP_NAME" {
  type = string
}

variable "APP_LABEL" {
  type = string
}

variable "IMAGE_PULL_SECRET_NAME" {
  type = string
}

variable "DOCKER_IMAGE" {
  type = string
}

variable "APP_SUBDOMAIN" {
  type = string
}

variable "APP_DOMAIN" {
  type = string
}