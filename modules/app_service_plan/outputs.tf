output "service_plan_id" {
  description = "The resource id of the App Service Plan"
  value       = azurerm_service_plan.ahwebapp3212_plan.id
}

output "service_plan_name" {
  description = "The name of the App Service Plan"
  value       = azurerm_service_plan.ahwebapp3212_plan.name
}
