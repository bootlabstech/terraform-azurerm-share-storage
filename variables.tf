variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}

variable "location" {
  type        = string
  description = "location of the resource group"
}

variable "name" {
  type = string
  description = "Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed."
}

variable "account_tier" {
  type = string
  description = "Defines the Tier to use for this storage account. For BlockBlobStorage and FileStorage accounts only Premium is valid."
  default = "Premium"
}

variable "account_kind" {
  type = string
  description = "Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2"
  default = "FileStorage"
}

variable "account_replication_type" {
  type = string
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
  default = "LRS"
}

variable "quota" {
  type = number
  description = "The maximum size of the share, in gigabytes. For Standard storage accounts, this must be 1GB (or higher) and at most 5120 GB (5 TB). For Premium FileStorage storage accounts, this must be greater than 100 GB and at most 102400 GB (100 TB)."
  default = 100
}