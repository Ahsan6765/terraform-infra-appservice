resource "azurerm_linux_web_app" "ahwebapp3212_app" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id

  site_config {
    application_stack {
      node_version = var.node_version
    }
    always_on       = true
    minimum_tls_version = "1.2"
  }

  identity {
    type = "SystemAssigned"
  }

  # Recommended app settings for build during deployment
  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}

# Optional: Configure GitHub deployment via Terraform
# Uncomment and populate `repo_url` and `branch` if you want Terraform
# to create the source control configuration. You will likely need a
# GitHub personal access token with repo access and/or a service principal
# with appropriate permissions.
#
# resource "azurerm_web_app_source_control" "source_control" {
#   app_id      = azurerm_linux_web_app.ahwebapp3212_app.id
#   repo_url    = var.github_repo_url
#   branch      = var.github_branch
#   is_manual_integration = true
#   # token = var.github_token # provider field name may vary by provider version
# }
