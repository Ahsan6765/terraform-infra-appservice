output "service_plan_id" {
  description = "The resource id of the App Service Plan"
  value       = azurerm_app_service_plan.this.id
}

output "service_plan_name" {
  description = "The name of the App Service Plan"
  value       = azurerm_app_service_plan.this.name
}
