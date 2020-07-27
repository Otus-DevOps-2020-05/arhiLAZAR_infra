variable zone {
  description = "Zone"
  default     = "europe-north1-b"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable "db_disk_image" {
  description = "Disk image for db"
  default     = "reddit-db-base"
}
