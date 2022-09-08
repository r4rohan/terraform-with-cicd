## --- REQUIRED PARAMETERS ------------------------------------------------------------------------------------------------

variable "gcp_project_id" {
  type        = string
  default     = "tfgagcp"
  description = "Id of the GCP project"
}

variable "region" {
  type        = string
  default     = "us-east1"
  description = "Region where the GCE VM Instance resides. Defaults to the Google provider's region if nothing is specified here. See https://cloud.google.com/compute/docs/regions-zones"
}

variable "zone" {
  type        = string
  default     = "us-central1-b"
  description = "Zone where the GCE VM Instance resides."
}

variable "active" {
  type        = bool
  default     = false
  description = "Create resources if true, delete if false."
}
