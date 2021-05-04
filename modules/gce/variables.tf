## --- REQUIRED PARAMETERS ------------------------------------------------------------------------------------------------

variable "suffix" {
  description = "An arbitrary suffix that will be added to the end of the resource name(s). For example: an environment name, a business-case name, a numeric id, etc."
  type        = string
  validation {
    condition     = length(var.suffix) <= 14
    error_message = "A max of 14 character(s) are allowed."
  }
}

variable "instance_name" {
  type        = string
  description = "A unique name for the GCE resource. Changing this forces a new resource to be created."
}

## --- OPTIONAL PARAMETERS ------------------------------------------------------------------------------------------------

variable "gcp_project_id" {
  type        = string
  description = "Project in which GCE Resources will be created."
}

variable "zone" {
  type        = string
  default     = "b"
  description = "The zone that the machine should be created in."
}

variable "instance_machine_type" {
  type        = string
  default     = "e2-medium"
  description = "The type of GCE VM instance for each nodes."
}

variable "network_tags" {
  type        = list(string)
  default     = []
  description = "A list of network tags to attach to the instance."
}


variable "boot_disk_size" {
  type        = number
  default     = 50
  description = "The size of the boot disk in GigaBytes."
}

variable "boot_disk_type" {
  type        = string
  default     = "pd-standard"
  description = "The GCE disk type. May be set to \"pd-standard\", \"pd-balanced\" or \"pd-ssd\"."
}

variable "boot_disk_image" {
  type        = string
  default     = "ubuntu-1804-lts"
  description = "GCE VM Instance Underlying Operating System"
}

variable "vpc_network_name" {
  type        = string
  default     = "default"
  description = "Virtual Private Cloud in which GCE VM Instance would be created. If you have custom VPC network, supply VPC Network Name."
}

variable "allow_stopping_for_update" {
  type        = bool
  default     = false
  description = "If true, allows Terraform to stop the instance to update its properties. If you try to update a property that requires stopping the instance without setting this field, the update will fail."
}

variable "vm_instance_timeout" {
  type        = string
  default     = "25m"
  description = "How long a GCE Instance creation operation is allowed to take before being considered a failure."
}

variable "static_ip_timeout" {
  type        = string
  default     = "5m"
  description = "How long a Static IP creation operation is allowed to take before being considered a failure."
}

variable "sa_timeout" {
  type        = string
  default     = "10m"
  description = "How long a Service Account creation operation is allowed to take before being considered a failure."
}
