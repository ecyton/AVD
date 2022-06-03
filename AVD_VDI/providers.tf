terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.0.2"
    }
    azuread = {
      source = "hashicorp/azuread"
    }
  }
}

provider "azurerm" {
  # Configuration options
  subscription_id = "1e5d5a77-5bb8-493e-9a80-87271fc0c024"
  features {
    
  }
}

#provider "azurerm" {
  # Configuration options
#  features {   
#  }
#  subscription_id = "1e5d5a77-5bb8-493e-9a80-87271fc0c024"
#  alias = "B"
#}

provider "azuread" {
  # Configuration options
  alias = "ad_ten"
}