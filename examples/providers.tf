terraform {
  required_version = ">= 0.13.1" # see https://releases.hashicorp.com/terraform/
  backend "gcs" {
    bucket = "cloudorbit"
    prefix = "main"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.68.0" # see https://github.com/terraform-providers/terraform-provider-google/releases
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.region
}
