variable "prefix" {
    type        = string
    description = "The prefix used for all resources in this example."
}

variable "resource_group_location" {
  default = "australiasoutheast"
  description = "The location of the resource group"
}

variable "resource_group_name" {
  default = "mydatabricksrg"
  description = "The name of the resource group"
}

variable "environment_tag" {
    default = "dev"
    description = "The environment tag"
}