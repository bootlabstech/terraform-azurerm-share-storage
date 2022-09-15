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
