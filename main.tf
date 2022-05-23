terraform {
  required_providers {
    sendgrid = {
      source  = "registry.terraform.io/Trois-Six/sendgrid"
      version = "0.2.1"
    }

    random = {
      source  = "registry.terraform.io/hashicorp/random"
      version = "3.2.0"
    }
  }
}

provider "sendgrid" {}
provider "random" {}

resource "random_pet" "api_key_name" {}

resource "sendgrid_api_key" "api_key" {
  name   = random_pet.api_key_name.id
  scopes = [
    "mail.send",
  ]
}


output "SG_KEY" {
  sensitive = true
  value     = sendgrid_api_key.api_key.api_key
}