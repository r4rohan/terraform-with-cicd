terraform {
  required_version = ">= 0.13.1" # see https://releases.hashicorp.com/terraform/
}

resource "google_compute_network" "vpc_network" {
  count                   = var.active ? 1 : 0
  #name                    = "terraform-network"
  name                    = "${var.instance_name}-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_instance" "vm_instance" {
  count        = var.active ? 1 : 0
  name         = "${var.instance_name}-instance"
  machine_type = "e2-micro"
  tags         = ["ssh"]
  depends_on   = [google_compute_network.vpc_network]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "${var.instance_name}-network"
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

