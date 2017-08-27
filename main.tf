// Variables
variable "env" {default = "lab1"}

// Providers
provider "google" {
  credentials = "${file("secrets/account.json")}"
  project     = "328846467581"
  region      = "europe-west1"
}

// Networks
resource "google_compute_network" "default" {
  name = "default-${var.env}"
}

//Subnetworks

resource "google_compute_subnetwork" "default" {
  name   = "default-${var.env}"
  region = "europe-west1"
  ip_cidr_range = "10.0.0.0/24"
  network = "${google_compute_network.default.name}"
}

//Instance

resource "google_compute_instance" "default-img" {
  name         = "default-img-${var.env}"
  machine_type = "f1-micro"
  zone         = "europe-west1-b"
  tags = ["default"]
  disk {
    image = "centos-cloud/centos-7"
  }
  network_interface {
    subnetwork = "${google_compute_subnetwork.default.name}"
  //  access_config = "${google_compute_address.default.name}"
  }
}
