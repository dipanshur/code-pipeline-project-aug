terraform {
  backend "s3" {

    bucket = "tg-devops-0830-weekday-aug-terraform-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}