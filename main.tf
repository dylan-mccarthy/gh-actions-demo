data "azurerm_databricks_workspace_private_endpoint_connection" "data" {
  workspace_id        = module.databricks.workspace_id
  private_endpoint_id = module.databricks.endpoint_id
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

module "network" {
  source = "./network"

  resource_group_name     = azurerm_resource_group.rg.name
  resource_group_location = azurerm_resource_group.rg.location
  prefix                  = var.prefix
  environment_tag         = var.environment_tag
}

module "databricks" {
  source = "./shared/databricks"

  resource_group_name     = azurerm_resource_group.rg.name
  resource_group_location = azurerm_resource_group.rg.location
  prefix                  = var.prefix
  environment_tag         = var.environment_tag
  databricks_sku          = var.databricks_sku
  cname                   = var.cname
  vnet_id                 = module.network.vnet_id
  public_subnet_name      = module.network.public_subnet_name
  private_subnet_name     = module.network.private_subnet_name
  public_nsga_id          = module.network.public_nsga_id
  private_nsga_id         = module.network.private_nsga_id
  endpoint_subnet_id      = module.network.endpoint_subnet_id
}

module "datafactory" {
  source = "./shared/datafactory"
}