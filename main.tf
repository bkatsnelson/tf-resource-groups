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
    resource_group_name  = "rg-cloud-shell-nonprod-use"
    storage_account_name = "stsmbcbkatsnelsonuse"
    container_name       = "tf-resource-groups"
    key                  = "terraform.state"
    subscription_id      = "c15bb9c5-2f4d-4112-b6d0-aa2434d885c9"
  }
}

data "terraform_remote_state" "network_shared" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rg-cloud-shell-nonprod-use"
    storage_account_name = "stsmbcbkatsnelsonuse"
    container_name       = "tf-net-shared"
    // use hr-network-nonprod-use2 workspace
    key             = "terraform.stateenv:hr-network-nonprod-use2"
    subscription_id = "c15bb9c5-2f4d-4112-b6d0-aa2434d885c9"
  }

}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = data.terraform_remote_state.network_shared.outputs.tenant_id
}

#----------------------------------------------------------
# Local Variables
#----------------------------------------------------------

locals {
  loc_acronym        = data.terraform_remote_state.network_shared.outputs.loc_acronym_map[var.location]
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
