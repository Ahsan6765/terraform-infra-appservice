# Azure App Service (PaaS) Terraform module

This repository creates an Azure App Service (Linux) using a module-based Terraform layout.

What I created
- Root `provider.tf`, `variables.tf`, `main.tf`, and `outputs.tf`.
- Module at `modules/webapp` with App Service Plan and Linux Web App.

Resource group
- Name: `ah-webapp-rg` (created in root `main.tf`).

Where to put your GitHub repo URL
- Set the repo URL in an environment-specific tfvars file (for example `dev.tfvars` or `prod.tfvars`) or pass on the CLI with `-var 'github_repo_url=...'`.
- Example `dev.tfvars` (already included):

```hcl
environment = "dev"
location = "East US"
resource_group_name = "ah-webapp-dev-rg"
app_service_plan_name = "ah-webapp-dev-plan"
app_service_name = "ah-webapp-dev"
github_repo_url = "https://github.com/OWNER/REPO"
github_branch   = "main"
# github_token = "<your_github_token>" # optional, keep secrets out of VCS
```

Notes about GitHub deployment
- The module contains a commented example `azurerm_web_app_source_control` block. Depending on the provider version the exact resource/arguments may differ. You can either:
  - Uncomment and configure the source control resource when you are ready (provide `github_token` as needed), or
  - Use Azure CLI to configure deployment after `terraform apply` (recommended and immediate):

```pwsh
# Example: configure deployment using Azure CLI
az webapp deployment source config \
  --name ah-webapp \
  --resource-group ah-webapp-rg \
  --repo-url https://github.com/OWNER/REPO \
  --branch main \
  --manual-integration
```

Azure authentication
- Terraform uses the Azure RM provider. Authenticate using one of the supported methods, for example environment variables for a service principal:

```pwsh
$env:ARM_CLIENT_ID = "<appId>"
$env:ARM_CLIENT_SECRET = "<password>"
$env:ARM_SUBSCRIPTION_ID = "<subscriptionId>"
$env:ARM_TENANT_ID = "<tenantId>"
```

Run the dev environment locally

```pwsh
cd envs/dev
terraform init
terraform plan -out plan.tfplan
terraform apply "plan.tfplan"
```

To target production use the root Terraform configuration with `-var-file=prod.tfvars` in the repo root, or create a separate `envs/prod` directory similar to `envs/dev`.

Outputs
- `app_default_hostname` and `app_url` are provided by the root outputs after apply.

Security
- Do not commit `github_token` or Terraform state files to Git. Use CI/CD secret stores or environment variables.
