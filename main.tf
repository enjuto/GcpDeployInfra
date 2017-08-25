// Necessary items to perform initial infrastructure bootstrap

// Variables
//variable "gw" {}
//variable "os_region" { default = "RegionOne" }
//variable "deployment" { }
//variable "dc" { }
//variable "pool" {default = "DEV"}
//variable "dns_server" { type = "list"}
//variable "dns_domain" { default = "iaas.igrupobbva" }
//variable "image" { }
//variable "extattr" { }
//variable "nomad_region" { }
//variable "consul_dc" { }
//variable "bootstrap_flavor_name" { default = "m1.small" }

variable "env" {default = "lab1"}

// Providers
provider "google" {
  credentials = "${file("secrets/account.json")}"
  project     = "328846467581"
  region      = "europe-west1"
}
