resource "google_compute_instance" "db" {
  name         = "reddit-db"
  machine_type = "f1-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.db_disk_image
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.db_ip.address
    }
  }

  metadata = {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  tags = ["reddit-db"]

}

resource "google_compute_address" "db_ip" {
  name = "reddit-db-ip"
}

resource "google_compute_firewall" "firewall_mongodb" {
  name    = "allow-mongodb-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }
  target_tags = ["reddit-db"]
  source_tags = ["reddit-app"]
}
