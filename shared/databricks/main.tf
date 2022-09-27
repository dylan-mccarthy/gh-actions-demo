resource "azurerm_databricks_workspace" "databricks-workspace" {
  name                        = "${var.prefix}-DBW"
  resource_group_name         = var.resource_group_name
  location                    = var.resource_group_location
  sku                         = var.databricks_sku
  managed_resource_group_name = "${var.prefix}-DBW-managed-private-endpoint"

  public_network_access_enabled         = false
  network_security_group_rules_required = "NoAzureDatabricksRules"

  custom_parameters {
    no_public_ip        = true
    public_subnet_name  = var.public_subnet_name
    private_subnet_name = var.private_subnet_name
    virtual_network_id  = var.vnet_id

    public_subnet_network_security_group_association_id  = var.public_nsga_id
    private_subnet_network_security_group_association_id = var.private_nsga_id
  }

  tags = {
    Environment = var.environment_tag
  }
}

resource "azurerm_private_endpoint" "databricks-endpoint" {
  name                = "${var.prefix}-pe-databricks"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  subnet_id           = var.endpoint_subnet_id

  private_service_connection {
    name                           = "${var.prefix}-psc"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_databricks_workspace.databricks-workspace.id
    subresource_names              = ["databricks_ui_api"]
  }
}

resource "azurerm_private_dns_zone" "dns" {
  depends_on = [azurerm_private_endpoint.databricks-endpoint]

  name                = "privatelink.azuredatabricks.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_cname_record" "dns-cname" {
  name                = azurerm_databricks_workspace.databricks-workspace.workspace_url
  zone_name           = azurerm_private_dns_zone.dns.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  record              = "${var.cname}.azuredatabricks.net"
}