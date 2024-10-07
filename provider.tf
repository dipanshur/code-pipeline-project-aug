terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.64.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-west-2"
  assume_role {
    role_arn     = "arn:aws:iam::211125425717:role/custom-devops-0830-weekday-aug-terraform-role"
    session_name = "devops-0830"
  }
}

