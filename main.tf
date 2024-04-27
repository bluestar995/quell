terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.26.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "bluestar-417002"
  region = "us-south1"
  credentials = file("bluestar-417002-9350d1e6172b.json")

}

resource "google_storage_bucket" "bluemoon995" {
  name          = "bluemoon995"
  location      = "us-south1"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://image-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}