output "default_hostname" {
  description = "Default hostname for the web app"
  value       = azurerm_linux_web_app.app.default_site_hostname
}

output "app_id" {
  description = "The resource id of the web app"
  value       = azurerm_linux_web_app.app.id
}
