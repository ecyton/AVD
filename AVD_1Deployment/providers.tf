terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.5.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">2.20.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  subscription_id = "1e5d5a77-5bb8-493e-9a80-87271fc0c024"
  features {

  }
}

provider "azuread" {
  # Configuration options
}