variable "name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "location" {
  description = "Azure region for the App Service Plan"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group in which to create the plan"
  type        = string
}

variable "sku_tier" {
  description = "SKU tier for the App Service Plan"
  type        = string
  default     = "Standard"
}

variable "sku_size" {
  description = "SKU size for the App Service Plan"
  type        = string
  default     = "S1"
}
