terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone

}

module "tf-instance-1" {
  source        = "./modules/instances"
  machine_type  = "e2-micro"
  instance_name = "tf-instance-1"
}

module "tf-instance-2" {
  source        = "./modules/instances"
  machine_type  = "e2-micro"
  instance_name = "tf-instance-2"
}