# Define Base Variables

variable "location" {
  type = string
}
variable "environment" {
  type = string
}
variable "app" {
  type = string
}
variable "loc_acronym_map" {
  type = map(any)
  default = {
    eastus    = "use",
    eastus2   = "use2",
    uscentral = "uscn"
  }
}
