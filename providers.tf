terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.66"
    }
  }
}

provider "aws" {
  default_tags {
    tags = var.talos_unique_id != "" ? {
      talos_unique_id      = var.talos_unique_id,
      deployed_by_poseidon = "true"
      } : {
      deployed_by_poseidon = "true"
    }
  }
}