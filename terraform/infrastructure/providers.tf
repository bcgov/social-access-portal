provider "kubernetes" {
  config_path    = "./kubeconfig"
  config_context = "pipeline"
}

provider "helm" {
  kubernetes {
      config_path    = "./kubeconfig"
      config_context = "pipeline"

  }
}