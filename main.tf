resource "azurerm_storage_account" "storage_account" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
 
}

resource "azurerm_storage_share" "storage_share" {
  name                 = "${var.name}-share"
  storage_account_name = azurerm_storage_account.storage_account.name
  quota                = var.quota
}

