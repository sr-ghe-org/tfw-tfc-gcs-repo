module "gcp_non_pci_buckets" {
  for_each                   = var.gcp_non_pci_bucket
  source                     = "../../terraform-gcp-gcs-gitvcs"
  bucket_type                = "non-pci"
  project_id                 = each.value.project_id
  project_number             = each.value.project_number
  bucket_name_prefix         = each.value.bucket_name_prefix
  regions                    = each.value.regions
  versioning                 = each.value.versioning
  labels                     = each.value.labels
  storage_class              = each.value.storage_class
  autoclass                  = each.value.autoclass
  iam_members                = each.value.iam_members
  retention_policy           = each.value.retention_policy
  lifecycle_rules            = each.value.lifecycle_rules
  force_destroy              = each.value.force_destroy
  public_access_prevention   = each.value.public_access_prevention
  soft_delete_policy         = each.value.soft_delete_policy
  kms_key_names              = each.value.kms_key_names
  internal_encryption_config = each.value.internal_encryption_config
}


module "gcp_pci_buckets" {
  for_each                   = var.gcp_pci_bucket
  source                     = "../../terraform-gcp-gcs-gitvcs"
  bucket_type                = "pci"
  project_id                 = each.value.project_id
  project_number             = each.value.project_number
  bucket_name_prefix         = each.value.bucket_name_prefix
  regions                    = each.value.regions
  versioning                 = each.value.versioning
  labels                     = each.value.labels
  storage_class              = each.value.storage_class
  autoclass                  = each.value.autoclass
  iam_members                = each.value.iam_members
  retention_policy           = each.value.retention_policy
  lifecycle_rules            = each.value.lifecycle_rules
  force_destroy              = each.value.force_destroy
  public_access_prevention   = "enforced"
  soft_delete_policy         = each.value.soft_delete_policy
  kms_key_names              = each.value.kms_key_names
  internal_encryption_config = each.value.internal_encryption_config
}