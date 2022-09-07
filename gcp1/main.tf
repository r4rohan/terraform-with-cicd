#locals {
#  suffix = format("%s-%s", "tf", random_string.launch_id.result)
#}

module "gcp1" {
  source = "../modules/gcp"
  #active = var.active
  #suffix           = local.suffix
  #source           = "../modules/gcp"
  #gcp_project_id   = var.gcp_project_id
  #vpc_network_name = "default"
  #instance_name    = "gcp1"
  #network_tags     = ["http-server", "https-server", "horse"]
}

