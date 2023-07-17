variable "resource_group_name" {
  description = "Enter name of Azure resource group"
  type        = string

}
variable "location" {
  description = "Enter Azure location."
  default     = "West Europe"

}
variable "tags" {
  description = "Enter the tags."

}
variable "shutter_apps" {
  default = []
}
variable "dns_zone_resource_group_name" {
  description = "Resource group name for DNS zone"
  default     = "reformMgmtRG"
}
variable "gh_token" {
  description = "Enter github acccess token"
}