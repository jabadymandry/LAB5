terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }

  # Task 3. Configure a remote backend
  backend "gcs" {
    bucket  = "tf-bucket-841837"
    prefix  = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
  
}

module "tf-instance-096923" {
  source = "./modules/instances"
  machine_type = "e2-standard-2"
  instance_name = "tf-instance-096923"
  # Task 6. Use a module from the Registry
  #network_name = module.network.network_name
  #subnetwork = module.network.subnets["${var.region}/subnet-01"].name

}

module "tf-instance-1" {
  source = "./modules/instances"
  machine_type = "e2-micro"
  instance_name = "tf-instance-1"
  # Task 6. Use a module from the Registry
  network_name = module.network.network_name
  subnetwork = module.network.subnets["${var.region}/subnet-01"].name

}

module "tf-instance-2" {
  source = "./modules/instances"
  machine_type = "e2-micro"
  instance_name = "tf-instance-2"
  # Task 6. Use a module from the Registry
  network_name = module.network.network_name
  subnetwork = module.network.subnets["${var.region}/subnet-02"].name
}
