variable "region" {
  type = string
}
#variable "resource_prefix" {
#  type = string
#}

variable "resource_prefix" {
  description = "Add the list of servernames that need to be created"
  type        = list(any)
  #default     = ["assess15", "assess16", "assess17"]
}

#variable "resource_db_prefix" {
  #description = "Add the list of servernames that need to be created"
  #type        = list(any)
  #default     = ["assess15", "assess16", "assess17"]
#}

variable "tag_id_map" {
  type = map(string)

  default = {
    environment = "production"
    application = "assessment"
  }
}

variable "resource_group_name" {
  type = string
}
