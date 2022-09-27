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
variable "databricks_sku" {
    default = "standard"
    description = "The sku of the databricks workspace"
}

variable "storage_account_name" {
    default = "mydatabricksstorage"
    description = "The name of the storage account"
}

variable "storage_account_tier" {
    default = "Standard"
    description = "The tier of the storage account"
}
  
variable "storage_account_replication_type" {
    default = "LRS"
    description = "The replication type of the storage account"
}

variable "storage_account_kind" {
    default = "StorageV2"
    description = "The kind of the storage account"
}

variable "cname" {
    default = "mydatabricks"
    description = "The name of the CNAME record"
}

variable "vnet_id" {
  description = "Virutal Network Id"
}

variable "environment_tag" {
    default = "dev"
    description = "The environment tag"
}

variable "public_subnet_name" {
    default = "public"
    description = "The name of the public subnet"
}

variable "private_subnet_name" {
    default = "private"
    description = "The name of the private subnet"
}

variable "public_nsga_id" {
    description = "The id of the public network security group association"
}

variable "private_nsga_id" {
    description = "The id of the private network security group association"
}

variable "endpoint_subnet_id" {
    description = "The id of the subnet to deploy the private endpoint"
}