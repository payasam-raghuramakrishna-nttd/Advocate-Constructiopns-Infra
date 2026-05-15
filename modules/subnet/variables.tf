
variable "resource_group_name" {}
variable "virtual_network_name" {}

variable "subnets" {
  type = map(list(string))
}
