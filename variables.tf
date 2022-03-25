# Define Base Variables

variable "location" {
  type    = string
  default = "eastus2"
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
  default = "90724b70-548e-401e-91c8-0a914f4645c4"
}
variable "tenant_id" {
  type    = string
  default = "ced0440f-4d83-4e2a-b044-f3c2b1816b04"
}
