variable "prefix" {
  type        = string
  description = "The prefix used for all resources in this example."
}

variable "resource_group_location" {
  default     = "australiasoutheast"
  description = "The location of the resource group"
}

variable "resource_group_name" {
  default     = "mydatabricksrg"
  description = "The name of the resource group"
}
variable "databricks_sku" {
  default     = "premium"
  description = "The sku of the databricks workspace"
}

variable "storage_account_name" {
  default     = "mydatabricksstorage"
  description = "The name of the storage account"
}

variable "storage_account_tier" {
  default     = "Standard"
  description = "The tier of the storage account"
}

variable "storage_account_replication_type" {
  default     = "LRS"
  description = "The replication type of the storage account"
}

variable "storage_account_kind" {
  default     = "StorageV2"
  description = "The kind of the storage account"
}

variable "cname" {
  default     = "mydatabricks"
  description = "The name of the CNAME record"
}

variable "environment_tag" {
  default     = "dev"
  description = "The environment tag"
}