terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.47.0"
    }
  }
  # backend "azurerm" {
  #   # resource_group_name  = "ajay01"
  #   # storage_account_name = "ajaystg04"
  #   # container_name       = "ajaycont"
  #   # key                  = "ajay.tfstate"

  # }
}

provider "azurerm" {
  features {}

  subscription_id = "c0748677-9808-4356-8816-dc8088c5bb59"
}
