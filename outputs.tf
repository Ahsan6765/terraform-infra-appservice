output "resource_group_name" {
  description = "Name of the resource group created"
  value       = azurerm_resource_group.rg.name
}

output "app_default_hostname" {
  description = "Default hostname of the deployed web app"
  value       = module.webapp.default_hostname
}

output "app_url" {
  description = "Public URL for the web app"
  value       = "https://${module.webapp.default_hostname}"
}
