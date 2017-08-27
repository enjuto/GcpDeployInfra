// Variables
variable "env" {default = "lab1"}

// Providers
provider "google" {
  credentials = "${file("secrets/account.json")}"
  project     = "328846467581"
  region      = "europe-west1"
}

// Networks
resource "google_compute_network" "network-1" {
  name = "network-1-${var.env}"
}

//Subnetworks

resource "google_compute_subnetwork" "subnet-1-a" {
  name   = "subnet-1-a-${var.env}"
  region = "europe-west1"
  ip_cidr_range = "10.0.1.0/24"
  network = "${google_compute_network.network-1.name}"
}

resource "google_compute_subnetwork" "subnet-1-b" {
  name   = "subnet-1-b-${var.env}"
  region = "europe-west1"
  ip_cidr_range = "10.0.2.0/24"
  network = "${google_compute_network.network-1.name}"
}

//Instance

resource "google_compute_instance" "instance-1-a-1" {
  name         = "instance-1-a-1-${var.env}"
  machine_type = "f1-micro"
  zone         = "europe-west1-b"
  tags = ["instance-1-a-1"]
  disk {
    image = "centos-cloud/centos-7"
  }
  network_interface {
    subnetwork = "${google_compute_subnetwork.subnet-1-a.name}"
  //  access_config = "${google_compute_address.default.name}"
  }
}

resource "google_compute_instance" "instance-1-b-1" {
  name         = "instance-1-b-1-${var.env}"
  machine_type = "f1-micro"
  zone         = "europe-west1-b"
  tags = ["instance-1-b-1"]
  disk {
    image = "centos-cloud/centos-7"
  }
  network_interface {
    subnetwork = "${google_compute_subnetwork.subnet-1-b.name}"
  //  access_config = "${google_compute_address.default.name}"
  }
}
