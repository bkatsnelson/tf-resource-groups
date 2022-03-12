
###########################################################
#
# Description: Create Azure Resource Group
#
#
# Author: Boris Katsnelson
#   Date: 08/2021
#
###########################################################

#----------------------------------------------------------
# Local Variables
#----------------------------------------------------------

locals {
  environment = lower(var.environment) == "qa" ? upper(var.environment) : title(var.environment)
}

#----------------------------------------------------------
# Create Environment Resource Groups For Specified Location
#----------------------------------------------------------

resource "azurerm_resource_group" "rg-postgres" {
  name     = "rg-${var.app}-postgres-${var.resource_qualifier}-001"
  location = var.location
  tags = {
    Environment = local.environment
    Cost_Center = "Postgres Database"
  }
}

resource "azurerm_resource_group" "rg-sql" {
  name     = "rg-${var.app}-sql-${var.resource_qualifier}-001"
  location = var.location
  tags = {
    Environment = local.environment
    Cost_Center = "SQL Database"
  }
}

resource "azurerm_resource_group" "rg-app-service" {
  name     = "rg-${var.app}-appsvc-${var.resource_qualifier}-001"
  location = var.location
  tags = {
    Environment = local.environment
    Cost_Center = "App Service"
  }
}

resource "azurerm_resource_group" "rg-aks" {
  name     = "rg-${var.app}-aks-${var.resource_qualifier}-001"
  location = var.location
  tags = {
    Environment = local.environment
    Cost_Center = "AKS Service"
  }
}

resource "azurerm_resource_group" "rg-vm" {
  name     = "rg-${var.app}-vm-${var.resource_qualifier}-001"
  location = var.location
  tags = {
    Environment = local.environment
    Cost_Center = "Virtual Machines"
  }
}
