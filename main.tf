###########################################################
#
# Description: Maintain Postgres Databases in Azure
#
#
# Author: Boris Katsnelson
#   Date: 08/2021
#
###########################################################

#----------------------------------------------------------
# Configure the Azure provider
#----------------------------------------------------------

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "cloud-shell-storage-eastus"
    storage_account_name = "cs2100320009f4f648c"
    container_name       = "tf-resource-groups"
    key                  = "terraform.state.bmk.dev"
    subscription_id      = "90724b70-548e-401e-91c8-0a914f4645c4"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

#----------------------------------------------------------
# Local Variables
#----------------------------------------------------------

locals {
  loc_acronym        = var.loc_acronym_map[var.location]
  resource_qualifier = "${var.environment}-${local.loc_acronym}"
}

#----------------------------------------------------------
# Create Resource Groups For Environment
#----------------------------------------------------------

module "resource_groups" {
  source = "./modules/resource_groups"

  location           = var.location
  app                = var.app
  environment        = var.environment
  resource_qualifier = local.resource_qualifier
}

#----------------------------------------------------------
# End of File
#----------------------------------------------------------
