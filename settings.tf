terraform {
  required_version = ">= 0.12.21"

  required_providers {
    opentelekomcloud = {
      source  = "opentelekomcloud/opentelekomcloud"
      version = ">= 1.23.6"
    }
  }
}
