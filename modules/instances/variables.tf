variable "instance_name" {
  type    = string
  default = "my-instance"
}

variable "machine_type" {
  type = string
}

variable "boot_disk" {
  type    = string
  default = "debian-cloud/debian-12"
}

variable "network_name" {
  type    = string
  default = "default"
}

variable "metadata_startup_script" {
  type    = string
  default = "echo Hi all > /tmp/test.txt"
}

variable "allow_stopping_for_update" {
  type    = bool
  default = true
}

variable "subnetwork" {
  type    = string
  default = "subnet-01"
}