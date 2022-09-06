resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"
  tags         = ["ssh"]
  depends_on   = [google_compute_network.vpc_network]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "terraform-network"
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
  length  = 4
  special = false
  upper   = false
}
#
#locals {
#  suffix = format("%s-%s", "tf", random_string.launch_id.result)
#}
#
#module "kylo_ren" {
#  source           = "../modules/gce"
#  suffix           = local.suffix
#  gcp_project_id   = var.gcp_project_id
#  vpc_network_name = "default"
#  instance_name    = "kylo-ren"
#  network_tags     = ["http-server", "https-server", "horse"]
#}
#
