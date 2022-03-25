# Define Base Variables

variable "location" {
  type    = string
  default = "eastus"
}
variable "environment" {
  type    = string
  default = "dev"
}
variable "app" {
  type    = string
  default = "itkpi"
}
variable "loc_acronym_map" {
  type = map(any)
  default = {
    eastus    = "use",
    eastus2   = "use2",
    uscentral = "uscn"
  }
}
variable "subscription_id" {
  type    = string
  default = "a57c592f-99a2-47b4-a046-bbc696cc98f7"
}
variable "tenant_id" {
  type    = string
  default = "032c0190-9b24-49f2-b7fc-27fad11e8caa"
}
