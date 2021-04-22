provider "google" {
  project     = var.project
  region      = var.location
  zone    = var.zone
}

resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = var.location
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "nodes" {
  name       = "my-node-pool"
  location = var.location
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    machine_type = "e2-medium"

  }
  autoscaling {
      min_node_count = "0"
      max_node_count = "3"
  }
}