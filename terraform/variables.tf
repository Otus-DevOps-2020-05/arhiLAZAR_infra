variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  default     = "europe-north1"
}
variable "bucket" {
  description = "Backet name for remote state"
  default     = "laz-terraform-state"
}
