
module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
}


module "app_service_plan" {
  source              = "./modules/app_service_plan"
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  sku_tier            = "Standard"
  sku_size            = "S1"
}

module "webapp" {
  source = "./modules/webapp"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  app_service_name = var.app_service_name
  service_plan_id  = module.app_service_plan.service_plan_id

  node_version     = var.node_version

  github_repo_url = var.github_repo_url
  github_branch   = var.github_branch
  github_token    = var.github_token
}
