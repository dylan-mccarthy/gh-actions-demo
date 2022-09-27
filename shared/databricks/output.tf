output "workspace_id" {
  value = azurerm_databricks_workspace.databricks-workspace.id
}

output "endpoint_id" {
  value = azurerm_private_endpoint.databricks-endpoint.id
}