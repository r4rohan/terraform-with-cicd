terraform {
  required_version = ">= 0.13.1" # see https://releases.hashicorp.com/terraform/
}

locals {
  instance_name = format("%s-%s", var.instance_name, var.suffix)
  region        = data.google_client_config.google_client.region
  zone          = format("%s-%s", local.region, var.zone)
  network_tags  = tolist(toset(var.network_tags))

  name_static_vm_ip = format("%s-ext-ip-%s", var.instance_name, var.suffix)

  sa_id = format("%s-sa-%s", var.instance_name, var.suffix)
}


resource "google_compute_network" "vpc_network" {
  count                   = var.active ? 1 : 0
  #name                    = "terraform-network"
  name                    = "${var.gcp_project_id}-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_instance" "vm_instance" {
  count        = var.active ? 1 : 0
  name         = "${var.gcp_project_id}-instance"
  machine_type = "e2-micro"
  tags         = ["ssh"]
  depends_on   = [google_compute_network.vpc_network]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "${var.gcp_project_id}-network"
    access_config {
    }
  }
  metadata_startup_script = "echo hi > /test.txt"
  metadata = {
    #    ssh-keys = join("\n", [for user, key in var.ssh_keys : "${user}:${key}"])
    #  ssh-keys = "boster:${file("boster.pub")}"
  }

}



resource "random_string" "launch_id" {
  count   = var.active ? 1 : 0
  length  = 4
  special = false
  upper   = false
}
##
##locals {
##  suffix = format("%s-%s", "tf", random_string.launch_id.result)
##}
##
##module "kylo_ren" {
##  source           = "../modules/gce"
##  suffix           = local.suffix
##  gcp_project_id   = var.gcp_project_id
##  vpc_network_name = "default"
##  instance_name    = "kylo-ren"
##  network_tags     = ["http-server", "https-server", "horse"]
##}
##
