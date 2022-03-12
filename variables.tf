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
  default = "iad"
}
variable "subscription_id" {
  type    = string
  default = "d58fbfba-be42-4145-9b37-31fd8cf19dc1"
}
variable "tenant_id" {
  type    = string
  default = "c7f6413d-1e73-45d2-b0da-a68713b515a7"
}
