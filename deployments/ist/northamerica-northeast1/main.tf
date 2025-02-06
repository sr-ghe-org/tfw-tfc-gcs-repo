module "gcs_buckets" {
  source             = "../../../root"
  gcp_non_pci_bucket = var.gcp_non_pci_bucket
  gcp_pci_bucket     = var.gcp_pci_bucket
}

