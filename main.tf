resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = "us-central1"
  project  = "lab-marceloweb"

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}



