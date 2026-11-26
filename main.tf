terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }

  # Task 3. Configure a remote backend
  backend "gcs" {
    bucket = "tf-bucket-127198"
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
  machine_type  = "e2-standard-2"
  instance_name = "tf-instance-1"
  network       = "default"
  subnetwork    = "default"
}

module "tf-instance-2" {
  source        = "./modules/instances"
  machine_type  = "e2-standard-2"
  instance_name = "tf-instance-2"
  network       = "default"
  subnetwork    = "default"
}

module "tf-instance-813334" {
  source        = "./modules/instances"
  machine_type  = "e2-standard-2"
  instance_name = "tf-instance-813334"
  network       = "default"
  subnetwork    = "default"
}

module "name" {
  source = "./modules/storage"
  bucket_name = var.bucket_name
  location = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}
