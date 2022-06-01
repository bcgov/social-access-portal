resource "kubernetes_network_policy" "sdpr_network_policy" {
  metadata {
    name      = "sdpr-network-policy"
    namespace = var.KUBE_NAMESPACE
  }

  spec {
    pod_selector {}

    ingress {
      from {
        namespace_selector {
          match_labels = {
            "network.openshift.io/policy-group" = "ingress"
          }
        }
      }
    }

    egress {} # single empty rule to allow all egress traffic

    policy_types = ["Ingress", "Egress"]
  }
}

resource "kubernetes_network_policy" "sdpr_network_policy_internal" {
  metadata {
    name      = "sdpr-network-policy-internal"
    namespace = var.KUBE_NAMESPACE
  }

  spec {
    pod_selector {}

    ingress {
      from {
        pod_selector {}
      }
    }
    policy_types = ["Ingress"]

  }
}