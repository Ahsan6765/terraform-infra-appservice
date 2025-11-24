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

  # Recommended app settings; include WEBSITE_NODE_DEFAULT_VERSION derived from node_version
  app_settings = merge(
    var.app_settings,
    {
      "WEBSITE_NODE_DEFAULT_VERSION" = "~${replace(var.node_version, "-lts", "") }",
      "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true"
    }
  )
}

# Optional: Configure GitHub deployment via Terraform
# Uncomment and populate `repo_url` and `branch` if you want Terraform
# to create the source control configuration. You will likely need a
# GitHub personal access token with repo access and/or a service principal
# with appropriate permissions.
#
/*
The `azurerm_web_app_source_control` resource is not available in some
versions of the azurerm provider. Creating it here caused an "Invalid
resource type" error on providers that don't implement it.

Recommended approaches to enable GitHub deployment:

- Use Azure CLI to configure source control (works for public and private repos):
  az webapp deployment source config \
    --name <app-name> \
    --resource-group <rg-name> \
    --repo-url <repo-url> \
    --branch <branch> \
    --manual-integration

- Use GitHub Actions to build and deploy your Node.js app (recommended):
  - Build in the workflow and deploy using `azure/webapps-deploy` or publish profile.

If you have a provider version that supports `azurerm_web_app_source_control` you
can add this resource back in to let Terraform configure continuous deployment.
*/

resource "null_resource" "github_deploy" {
  count = var.github_repo_url != "" ? 1 : 0

  # Re-run when repo, branch or app id changes
  triggers = {
    repo   = var.github_repo_url
    branch = var.github_branch
    app_id = azurerm_linux_web_app.ahwebapp3212_app.id
  }

  provisioner "local-exec" {
    # This runs the Azure CLI command locally where Terraform is executed.
    # Ensure the Azure CLI is installed and you are authenticated (az login).
    command = <<EOT
az webapp deployment source config --name ${azurerm_linux_web_app.ahwebapp3212_app.name} --resource-group ${azurerm_linux_web_app.ahwebapp3212_app.resource_group_name} --repo-url '${var.github_repo_url}' --branch ${var.github_branch} --manual-integration${var.github_token != "" ? format(" --git-token %s", var.github_token) : ""}
EOT
  }
}
