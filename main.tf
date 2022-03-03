terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
    twingate = {
      source  = "Twingate/twingate"
      version = "0.1.6"
    }
  }

  required_version = ">= 1.1.0"

  # Update to backend hosted in terraform cloud

  #  backend "remote" {
  #    hostname     = "app.terraform.io"
  #    organization = "steelpatriot"
  #    workspaces {
  #      name = "tbd"
  #    }
  #  }
}

# region, key, and id will be picked up by workflow environment variables in GH -- jwf

provider "aws" {
  region = var.aws_region
}



