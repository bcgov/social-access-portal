provider "kubernetes" {
  config_path    = "./kubeconfig"
  config_context = "pipeline"
}