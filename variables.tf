# Define Base Variables

variable "location" {
  type    = string
  default = "eastus2"
}
variable "environment" {
  type    = string
  default = "qa"
}
variable "app" {
  type    = string
  default = "hr"
}
variable "subscription_id" {
  type    = string
  default = "c15bb9c5-2f4d-4112-b6d0-aa2434d885c9"
}
