terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.93.0"
    }
  }
    #backend "azurerm" {
    #resource_group_name  = "IAAC"
    #storage_account_name = "infracodeterraform"
    #container_name       = "tfstate"
    #key                  = "doapp/doapp_31_35.tfstate"
    #access_key = "__storagekey__"
  #}
}

# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  #subscription_id = "9fcc9c96–8044–XXXX-XXXX–XXXXXXXXXXXX"
  #client_id = "97545937–XXXX–XXXX-XXXX-XXXXXXXXXXXX"
  #client_secret = ".3GGR_XXXXX~XXXX-XXXXXXXXXXXXXXXX"
  #tenant_id = "73d20f0d-XXXX–XXXX–XXXX-XXXXXXXXXXXX"
  #  version = "2.81.0"
  features {}
}
# Create a resource group
resource "azurerm_resource_group" "bootlab_rg" {
  count    = length(var.resource_prefix)
  name     = var.resource_prefix[count.index]
  location = var.region
}


###########################################################################################################
#Storage account creation for Authoring & Cache
resource "azurerm_storage_account" "stgaccount" {
  count                    = length(var.resource_prefix)
  name                     = var.resource_prefix[count.index]
  resource_group_name      = azurerm_resource_group.bootlab_rg[count.index].name
  location                 = azurerm_resource_group.bootlab_rg[count.index].location
  account_tier             = "Premium"
  account_replication_type = "LRS"
  account_kind             = "FileStorage"
  tags = {
    environment = var.tag_id_map["environment"]
    application = var.tag_id_map["application"]
  }
}


#Storage share creation for Authoring & Cache in respective storageaccounts
resource "azurerm_storage_share" "stgshare" {
  count                = length(var.resource_prefix)
  name                 = var.resource_prefix[count.index]
  storage_account_name = azurerm_storage_account.stgaccount[count.index].name
  quota                = 100
}

##############################################################################################################
