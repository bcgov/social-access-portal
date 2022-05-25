module "keycloak" {
    source = "./keycloak"
    dev_client_id = var.dev_client_id 
    dev_client_secret = var.dev_client_secret 
    dev_username = var.dev_username 
    dev_password = var.dev_password 
    dev_keycloak_url = var.dev_keycloak_url 
    test_client_id = var.test_client_id 
    test_client_secret = var.test_client_secret 
    test_username = var.test_username 
    test_password = var.test_password 
    test_keycloak_url = var.test_keycloak_url 
    prod_client_id = var.prod_client_id 
    prod_client_secret = var.prod_client_secret 
    prod_username = var.prod_username 
    prod_password = var.prod_password 
    prod_keycloak_url = var.prod_keycloak_url 
    test_siteminder_signing_certificate = var.test_siteminder_signing_certificate 
    prod_siteminder_signing_certificate = var.prod_siteminder_signing_certificate 

}
