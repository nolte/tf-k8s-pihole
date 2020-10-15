resource "kubernetes_namespace" "acc_namespace" {
  metadata {
    name = "acc-tf-k8s-pihole"
  }
}

module "install" {
  source    = "../../modules/install"
  namespace = kubernetes_namespace.acc_namespace.metadata[0].name
}

output "helm_release" {
  value = module.install.release
}