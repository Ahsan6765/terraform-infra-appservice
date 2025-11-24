output "default_hostname" {
  description = "Default hostname for the web app (derived from name)"
  # The provider may not always export the hostname attribute across versions.
  # Construct it from the app name which maps to <name>.azurewebsites.net
  value = "${azurerm_linux_web_app.ahwebapp3212_app.name}.azurewebsites.net"
}

output "app_id" {
  description = "The resource id of the web app"
  value       = azurerm_linux_web_app.ahwebapp3212_app.id
}
