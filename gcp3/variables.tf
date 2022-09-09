## --- REQUIRED PARAMETERS ------------------------------------------------------------------------------------------------

variable "gcp_project_id" {
  type        = string
  default     = "tfgagcp"
  description = "Id of the GCP project"
}

variable "gcp_instance_id" {
  type        = string
  default     = "gcp3"
  description = "Id of the GCP project"
}
variable "region" {
  type        = string
  default     = "us-east1"
  description = "Region where the GCE VM Instance resides. Defaults to the Google provider's region if nothing is specified here. See https://cloud.google.com/compute/docs/regions-zones"
}

variable "zone" {
  type        = string
  default     = "us-east1-c"
  description = "Zone where the GCE VM Instance resides."
}

variable "active" {
  type        = bool
  default     = false
  description = "Create resources if true, delete if false."
}
variable "tags" {
  default = ["http-server", "https-server"]
}

