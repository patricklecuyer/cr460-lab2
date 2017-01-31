resource "google_compute_instance" "master" {

  name         = "vault"
  machine_type = "f1-micro"
  zone         = "us-east1-c"

  disk {
   type    = "pd-standard"
   image = "coreos-beta-1235-1-0-v20161130"
  }


network_interface {
   subnetwork = "${google_compute_subnetwork.default-us-east1.name}"
   access_config {
     nat_ip = "${google_compute_address.vault.address}"
   }
 }
}
