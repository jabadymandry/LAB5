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
  network       = var.vpc_name
  subnetwork    = "subnet-01"
}

module "tf-instance-2" {
  source        = "./modules/instances"
  machine_type  = "e2-standard-2"
  instance_name = "tf-instance-2"
  network       = var.vpc_name
  subnetwork    = "subnet-02"
}

module "name" {
  source = "./modules/storage"
  bucket_name = var.bucket_name
  location = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}


# Task 6. Use a module from the Registry
module "network" {
  source  = "terraform-google-modules/network/google"
  version = "10.0.0"
  network_name = var.vpc_name
  routing_mode = "GLOBAL"
  project_id = var.project_id
  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = var.region
    },
    {
      subnet_name   = "subnet-02"
      subnet_ip     = "10.10.20.0/24"
      subnet_region = var.region
    }
  ]
}

# Task 7. Configure a firewall
resource "google_compute_firewall" "default" {
  name    = "tf-firewall"
  network = module.network.network_name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}