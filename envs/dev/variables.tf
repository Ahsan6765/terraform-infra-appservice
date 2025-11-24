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

variable "node_version" {
  description = "Node.js major version to use for the dev web app (e.g. 18)"
  type        = string
  default     = "22-lts"
}

variable "sku_tier" {
  description = "SKU tier for App Service Plan in dev (Basic/Standard/Premium)"
  type        = string
  default     = "Basic"
}

variable "sku_size" {
  description = "SKU size for App Service Plan in dev (e.g. B1, S1)"
  type        = string
  default     = "B1"
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
