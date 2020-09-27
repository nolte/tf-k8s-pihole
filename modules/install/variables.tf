variable "namespace" {
  default = ""
}

variable "extra_dns_entries" {
  type    = list(string)
  default = []
}

variable "chart_version" {
  default = "1.7.17"
}

variable "extra_values" {
  default = {}
}
