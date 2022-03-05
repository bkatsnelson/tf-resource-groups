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
    storage_account_name = "stsmbcbkatsnelsonuse"
    container_name       = "tf-resource-groups"
    key                  = "terraform.state"
    subscription_id      = "c15bb9c5-2f4d-4112-b6d0-aa2434d885c9"
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {}
  alias = "value"
}

#----------------------------------------------------------
# Local Variables
#----------------------------------------------------------

locals {
  loc_acronym        = var.loc_acronym_map[var.location]
  resource_qualifier = "${var.app}-${var.environment}-${local.loc_acronym}"
}

#----------------------------------------------------------
# Create Resource Groups For Environment
#----------------------------------------------------------

module "resource_groups" {
  source = "./modules/resource_groups"

  location           = var.location
  environment        = var.environment
  resource_qualifier = local.resource_qualifier
}

#----------------------------------------------------------
# End of File
#----------------------------------------------------------
