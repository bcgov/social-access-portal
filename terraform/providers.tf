provider "kubernetes" {
  config_context = "roy-cli"
  config_path    = "./kubeconfig"
}

provider "helm" {
  kubernetes { 
    config_context = "roy-cli"
    config_path    = "./kubeconfig"
  }
}