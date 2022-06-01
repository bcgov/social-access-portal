# Postgres variables
variable "DB_USER_PASSWORD" {
  type      = string
  sensitive = true
}

variable "DB_USER_USERNAME" {
  type      = string
  sensitive = true
}

variable "DB_ROOT_PASSWORD" {
  type      = string
  sensitive = true
}

variable "DB_DATABASE" {
  type    = string
  default = "sdpr"
}

variable "DB_PORT" {
  type    = string
  default = "5432"
}

# Keycloak variables
variable "KEYCLOAK_ADMIN_USERNAME" {
  type      = string
  sensitive = true
}

variable "KEYCLOAK_ADMIN_PASSWORD" {
  type      = string
  sensitive = true
}

variable "IMAGE_TAG" {
  type    = string
  default = "latest"
}

# Kubernetes variables
variable "KUBE_NAMESPACE" {
  type    = string
  default = "b0f542-dev"
}

variable "HOST_DOMAIN" {
  type    = string
  default = "apps.silver.devops.gov.bc.ca"
}

variable "SUB_DOMAIN" {
  type = string
}

variable "KEYCLOAK_REGISTRY_USERNAME" {
  type = string
}

variable "KEYCLOAK_REGISTRY_API_KEY" {
  type = string
}

variable "KEYCLOAK_REGISTRY_URL" {
  type = string
  default = "ssag.jfrog.io"
}
