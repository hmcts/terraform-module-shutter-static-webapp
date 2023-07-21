variable "resource_group_name" {
  description = "Azure resource group"
  type        = string

}
variable "location" {
  description = "Azure location."
  default     = "West Europe"

}
variable "tags" {
  description = "Azure tags."

}
variable "shutter_apps" {
  default = []
}
variable "dns_zone_resource_group_name" {
  description = "Resource group name for DNS zone"
  default     = "reformMgmtRG"
}
variable "gh_token" {
  description = "github access token"
}