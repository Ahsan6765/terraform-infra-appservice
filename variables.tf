variable "location" {
  description = "Azure region to deploy resources in"
  type        = string
  default     = "East US"
}

variable "github_repo_url" {
  description = "GitHub repository URL or owner/repo (set this later to enable GitHub deployment)."
  type        = string
  default     = ""
}

variable "github_branch" {
  description = "Branch to deploy from (used when configuring GitHub deployment)."
  type        = string
  default     = "main"
}

variable "github_token" {
  description = "Personal access token for GitHub (optional). Prefer providing via CI or environment variables."
  type        = string
  sensitive   = true
  default     = ""
}

variable "linux_fx_version" {
  description = "Runtime stack for the Linux web app. Defaults to Node.js 18 LTS."
  type        = string
  default     = "NODE|18-lts"
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)."
  type        = string
  default     = "dev"
}

variable "resource_group_name" {
  description = "Name of the resource group to create"
  type        = string
  default     = "ah-webapp-rg"
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "ah-webapp-plan"
}

variable "app_service_name" {
  description = "Name of the App Service (must be globally unique)"
  type        = string
  default     = "ah-webapp"
}
