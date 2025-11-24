resource "azurerm_service_plan" "ahwebapp3212_plan" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"

  # sku_name expected values are like "F1", "B1", "S1", "P1v2" depending on tier/size.
  # Use `sku_size` (for example "B1" or "S1") as the sku_name.
  sku_name = var.sku_size
}
