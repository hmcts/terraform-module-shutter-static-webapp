variable "subscription_id" {
  description = "Enter Azure subscription id."
}
variable "location" {
  description = "Enter Azure location."
  default     = "West Europe"

}
variable "env" {
  description = "Enter the environment. eg prod, aat"
}

variable "product" {
  description = "The name of the product."
}
variable "builtFrom" {
  description = "The name of the Github repo."
}

variable "expiresAfter" {
  description = "Expiration date"
}

variable "project" {
  description = "The name of the project."
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