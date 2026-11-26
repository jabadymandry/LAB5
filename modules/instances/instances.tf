resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = var.boot_disk
      labels = {
        my_label = "disk-${var.instance_name}"
      }
    }
  }

  // Local SSD disk
#   scratch_disk {
#     interface = "NVME"
#   }

  network_interface {
    network = var.network_name
    subnetwork = var.subnetwork
    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = var.metadata_startup_script
	allow_stopping_for_update = var.allow_stopping_for_update
}
