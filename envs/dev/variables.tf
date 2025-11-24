variable "location" {
  description = "Azure region to deploy resources in"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group to create for dev"
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan for dev"
  type        = string
}

variable "app_service_name" {
  description = "Name of the App Service for dev (must be globally unique)"
  type        = string
}

variable "linux_fx_version" {
  description = "Runtime stack for the Linux web app. Defaults to Node.js 18 LTS."
  type        = string
  default     = "NODE|18-lts"
}

variable "github_repo_url" {
  description = "(optional) GitHub repo URL - set in terraform.tfvars to wire source control"
  type        = string
  default     = ""
}

variable "github_branch" {
  description = "(optional) GitHub branch to deploy from"
  type        = string
  default     = "main"
}

variable "github_token" {
  description = "(optional) GitHub personal access token to configure source control (sensitive)"
  type        = string
  sensitive   = true
  default     = ""
}
