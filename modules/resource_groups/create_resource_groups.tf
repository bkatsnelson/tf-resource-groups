
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
# Create Environment Resource Groups For Specified Location
#----------------------------------------------------------

resource "azurerm_resource_group" "rg-postgres" {
  name     = "rg-postgres-${var.resource_qualifier}-001"
  location = var.location
  tags = {
    Environment = title(var.environment)
    Cost_Center = "Postgres Database"
  }
}

resource "azurerm_resource_group" "rg-sql" {
  name     = "rg-sql-${var.resource_qualifier}-001"
  location = var.location
  tags = {
    Environment = title(var.environment)
    Cost_Center = "SQL Database"
  }
}

resource "azurerm_resource_group" "rg-app-service" {
  name     = "rg-app-service-${var.resource_qualifier}-001"
  location = var.location
  tags = {
    Environment = title(var.environment)
    Cost_Center = "App Service"
  }
}

resource "azurerm_resource_group" "rg-aks" {
  name     = "rg-aks-${var.resource_qualifier}-001"
  location = var.location
  tags = {
    Environment = title(var.environment)
    Cost_Center = "AKS Service"
  }
}

resource "azurerm_resource_group" "rg-vm" {
  name     = "rg-vm-${var.resource_qualifier}-001"
  location = var.location
  tags = {
    Environment = title(var.environment)
    Cost_Center = "Virtual Machines"
  }
}
