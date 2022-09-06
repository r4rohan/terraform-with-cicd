resource "google_compute_firewall" "default" {
  name    = "fw-allow-bastion"
  network = google_compute_network.vpc_network.name
allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags = ["ssh"]
  source_ranges = ["76.230.87.139/32"]
  }
~         
