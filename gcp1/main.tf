module "gcp" {
  active           = var.active
  source           = "../modules/gcp"
  gcp_project_id   = var.gcp_project_id
  vpc_network_name = "${var.gcp_instance_id}-default"
  instance_name    = var.gcp_instance_id
  network_tags     = concat(var.tags, var.gcp_instance_id)
}

