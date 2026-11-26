terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }

  # Task 3. Configure a remote backend
  backend "gcs" {
    bucket = "tf-instance-813334"
    prefix = "terraform/state"
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
  network       = "default"
  subnetwork    = "default"
}

module "tf-instance-2" {
  source        = "./modules/instances"
  machine_type  = "e2-micro"
  instance_name = "tf-instance-2"
  network       = "default"
  subnetwork    = "default"
}

module "name" {
  source = "./modules/storage"
  bucket_name = var.bucket_name
  location = "US"
}