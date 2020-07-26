terraform {
  backend "gcs" {
    bucket = "laz-terraform-state"
    prefix = "prod"
  }
}
