variable "resource_group_name" {
  description = "Name of the resource group to create resources in"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "app_service_name" {
  description = "Name for the App Service (must be globally unique within Azure web apps namespace)"
  type        = string
}

variable "sku_tier" {
  description = "SKU tier for App Service Plan"
  type        = string
  default     = "Standard"
}

variable "sku_size" {
  description = "SKU size for App Service Plan"
  type        = string
  default     = "S1"
}

variable "service_plan_id" {
  description = "The resource id of an existing App Service Plan to attach the web app to"
  type        = string
}

variable "node_version" {
  description = "Node.js major version to use for the web app (e.g. 18)"
  type        = string
  default     = "22-lts"
}

variable "github_repo_url" {
  description = "(optional) GitHub repo URL - set in root and passed to module to wire source control"
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

variable "app_settings" {
  description = "Additional app settings to apply to the Web App (map)"
  type        = map(string)
  default     = {}
}
