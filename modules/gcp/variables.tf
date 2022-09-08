variable "active" {
  type        = bool
  default     = false
  description = "Create resources if true, delete if false."
}
variable "gcp_project_id" {}
variable "vpc_network_name" {}
variable "instance_name" {}
variable "network_tags" {}
