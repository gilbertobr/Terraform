provider "google" {
  project = var.project
  region  = var.region
  zone    = "${var.region}-c"
}

resource "google_compute_firewall" "firewall" {
  name    = "firewall-externalssh"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["externalssh"]
}

resource "google_compute_firewall" "webserverrule" {
  name    = "webserver"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = [ "20-21", "25" , "53", "80", "110", "143", "443", "465", "587", "953", "993", "995", "3306", "10001-10009", "20000", "30000-35000" ]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["webserver"]
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-virtualmin"
  machine_type = "e2-medium"
  zone         = "${var.region}-c"
  tags         = ["externalssh","webserver"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
      size = 50
    }
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = google_compute_address.static.address
    }

  }

  provisioner "remote-exec" {
    connection {
      host        = google_compute_address.static.address
      type        = "ssh"
      user        = var.user
      timeout     = "500s"
      private_key = file(var.privatekeypath)
    }

    inline = [
      "sudo apt-get update",
      "sudo apt-get install wget vim curl git -y",
      "cd ~ && wget http://software.virtualmin.com/gpl/scripts/install.sh",
      "sudo /bin/sh install.sh --force"
    ]
  }

  depends_on = [ google_compute_firewall.firewall, google_compute_firewall.webserverrule ]

  metadata = {
    ssh-keys = "${var.user}:${file(var.publickeypath)}"
  }

}

resource "google_compute_address" "static" {
  name = "vm-public-address"
  project = var.project
  region = var.region
  depends_on = [ google_compute_firewall.firewall ]
}