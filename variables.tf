#------------------------------------------------------------
# Main Variables
#------------------------------------------------------------

variable "location" {
  type = string
}
variable "environment" {
  type = string
}
variable "app" {
  type = string
}

#------------------------------------------------------------
# Subscription Variables
#------------------------------------------------------------

variable "subscription_id" {
  type = string
}
variable "tenant_id" {
  type = string
}

#------------------------------------------------------------
# Shared Variables 
#------------------------------------------------------------

variable "loc_acronym_map" {
  type = map(any)
  default = {
    eastus    = "use",
    eastus2   = "use2",
    uscentral = "uscn"
  }
}
