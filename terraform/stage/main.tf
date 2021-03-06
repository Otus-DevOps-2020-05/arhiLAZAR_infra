//terraform {
//  required_version = "0.12.8"
//}

provider "google" {
  version = "2.15"
  project = var.project
  region  = var.region
}
module "app" {
  source          = "../modules/app"
  zone            = var.zone
  public_key_path = var.public_key_path
  app_disk_image  = var.app_disk_image
}
module "db" {
  source          = "../modules/db"
  zone            = var.zone
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
}
module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["0.0.0.0/0"]
}
