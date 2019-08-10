variable "PROJECT_ID" {
  type        = string
}
provider "google" {
 //credentials = NOT NEEDED, use Cloud Build service account permissions
 project     = var.PROJECT_ID
 region      = "us-central1"
}

terraform {
  backend "gcs" {
    bucket  = "my-state-bucket"
    prefix  = "terraform/state"
  }
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

// A single Google Cloud Engine instance
resource "google_compute_instance" "default" {
 name         = "vm-${random_id.instance_id.hex}"
 machine_type = "f1-micro"
 zone         = "us-central1-c"

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }

 network_interface {
   network = "default"

 }
}
