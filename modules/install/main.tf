
locals {
  EXTRA_VALUES = {
    dnsmasq = {
      customDnsEntries = var.extra_dns_entries
    }
    persistentVolumeClaim = {
      enabled = "true"
    }
    extraEnvVars = {
      "TZ" = "Europe/Berlin"
    }
    doh = {
      enabled = "true"
    }
  }
}


resource "helm_release" "release" {
  name       = "pihole"
  repository = "https://mojo2600.github.io/pihole-kubernetes/"
  chart      = "pihole"
  version    = var.chart_version

  namespace = var.namespace
  values = [
    yamlencode(local.EXTRA_VALUES),
    yamlencode(var.extra_values)
  ]
}
