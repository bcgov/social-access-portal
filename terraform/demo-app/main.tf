# ---------------------- Image Pull Secret ---------------------- #
resource "kubernetes_secret" "docker-registry" {
  metadata {
    name      = "demo-app-image-pull-secret"
    namespace = "${var.NAMESPACE}"
  }

  data = {
    ".dockerconfigjson" = "${data.template_file.docker_config_script.rendered}"
  }

  type = "kubernetes.io/dockerconfigjson"
}


data "template_file" "docker_config_script" {
  template = file("${path.module}/docker-auth.json")
  vars = {
    docker-username = var.DOCKER_USERNAME
    docker-password = var.DOCKER_PASSWORD
    docker-server   = var.DOCKER_SERVER
    docker-email    = var.DOCKER_EMAIL
    auth            = base64encode("${var.DOCKER_USERNAME}:${var.DOCKER_PASSWORD}")
  }
}

module "demo_app_1" {
  source = "./deployment"

  KEYCLOAK_AUTHORITY = var.KEYCLOAK_AUTHORITY
  KEYCLOAK_CLIENT_ID = var.APP_1_KEYCLOAK_CLIENT_ID
  KEYCLOAK_CLIENT_SECRET = var.APP_1_KEYCLOAK_CLIENT_SECRET
  KEYCLOAK_REDIRECT_URI = "https://${var.APP_1_SUBDOMAIN}.${var.DOMAIN}"
  APP_TITLE = var.APP_1_TITLE
  APP_NAME = var.APP_1_NAME
  APP_LABEL = var.APP_1_LABEL
  IMAGE_PULL_SECRET_NAME = kubernetes_secret.docker-registry.metadata[0].name
  DOCKER_IMAGE = var.DOCKER_IMAGE
  APP_SUBDOMAIN = var.APP_1_SUBDOMAIN
  APP_DOMAIN = var.DOMAIN
  NAMESPACE = var.NAMESPACE
}

module "demo_app_2" {
  source = "./deployment"

  KEYCLOAK_AUTHORITY = var.KEYCLOAK_AUTHORITY
  KEYCLOAK_CLIENT_ID = var.APP_2_KEYCLOAK_CLIENT_ID
  KEYCLOAK_CLIENT_SECRET = var.APP_2_KEYCLOAK_CLIENT_SECRET
  KEYCLOAK_REDIRECT_URI = "https://${var.APP_2_SUBDOMAIN}.${var.DOMAIN}"
  APP_TITLE = var.APP_2_TITLE
  APP_NAME = var.APP_2_NAME
  APP_LABEL = var.APP_2_LABEL
  IMAGE_PULL_SECRET_NAME = kubernetes_secret.docker-registry.metadata[0].name
  DOCKER_IMAGE = var.DOCKER_IMAGE
  APP_SUBDOMAIN = var.APP_2_SUBDOMAIN
  APP_DOMAIN = var.DOMAIN
  NAMESPACE = var.NAMESPACE
}