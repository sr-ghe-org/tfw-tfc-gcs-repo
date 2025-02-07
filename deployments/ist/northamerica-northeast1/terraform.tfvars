gcp_non_pci_bucket = {
  "gcs1" = {
    bucket_name_prefix = "sr"
    project_id         = "pr-hvpc-1056d88565a4"
    regions            = ["northamerica-northeast1", "northamerica-northeast2"]
    versioning         = true
    storage_class      = "NEARLINE"
    project_number     = "828184145025"
    soft_delete_policy = {
      retention_duration_seconds = 900000
    }
    labels = {
      "env" = "prod"
    }
    kms_key_names = {
      "northamerica-northeast1" = "projects/pr-hvpc-1056d88565a4/locations/northamerica-northeast1/keyRings/pci-ring/cryptoKeys/pci-key-mon"
      "northamerica-northeast2" = "projects/pr-hvpc-1056d88565a4/locations/northamerica-northeast2/keyRings/pci-ring-tor/cryptoKeys/pci-key-tor"
    }
    iam_members = [
      {
        role   = "roles/storage.objectUser"
        member = "serviceAccount:b-32-988@pr-hvpc-1056d88565a4.iam.gserviceaccount.com"
      },
      {
        role   = "roles/storage.objectCreator"
        member = "serviceAccount:a-833-223@pr-hvpc-1056d88565a4.iam.gserviceaccount.com"
      }
    ]
    retention_policy = {
      is_locked        = false
      retention_period = 220752000
    }
    lifecycle_rules = [
      {
        action = {
          type          = "SetStorageClass"
          storage_class = "ARCHIVE"
        }
        condition = {
          age              = 365 * 7
          send_age_if_zero = true
          with_state       = "LIVE"
        }
      }
    ]
  }
  "non_pci_bucket_2" = {
    bucket_name_prefix = "sr-cmek-user"
    project_id         = "pr-hvpc-1056d88565a4"
    regions            = ["northamerica-northeast1", "northamerica-northeast2"]
    versioning         = true
    storage_class      = "NEARLINE"
    project_number     = "828184145025"
    soft_delete_policy = {
      retention_duration_seconds = 900000
    }
    labels = {
      "env" = "prod"
    }
    internal_encryption_config = {
      create_encryption_key = true
      prevent_destroy       = false
    }
    iam_members = [
      {
        role   = "roles/storage.objectUser"
        member = "serviceAccount:b-32-988@pr-hvpc-1056d88565a4.iam.gserviceaccount.com"
      },
      {
        role   = "roles/storage.objectCreator"
        member = "serviceAccount:a-833-223@pr-hvpc-1056d88565a4.iam.gserviceaccount.com"
      }
    ]
    retention_policy = {
      is_locked        = false
      retention_period = 220752000
    }
    lifecycle_rules = [
      {
        action = {
          type          = "SetStorageClass"
          storage_class = "ARCHIVE"
        }
        condition = {
          age              = 365 * 7
          send_age_if_zero = true
          with_state       = "LIVE"
        }
      }
    ]
  }
}

gcp_pci_bucket = {
  "pci_bucket_1" = {
    bucket_name_prefix = "sr"
    project_id         = "pr-hvpc-1056d88565a4"
    project_number     = "828184145025"
    regions            = ["northamerica-northeast1", "northamerica-northeast2"]
    versioning         = true
    kms_key_names = {
      "northamerica-northeast1" = "projects/pr-hvpc-1056d88565a4/locations/northamerica-northeast1/keyRings/pci-ring/cryptoKeys/pci-key-mon"
      "northamerica-northeast2" = "projects/pr-hvpc-1056d88565a4/locations/northamerica-northeast2/keyRings/pci-ring-tor/cryptoKeys/pci-key-tor"
    }
    labels = {
      "env" = "prod"
    }
    iam_members = [
      {
        role   = "roles/storage.objectUser"
        member = "serviceAccount:b-32-988@pr-hvpc-1056d88565a4.iam.gserviceaccount.com"
      }
    ]
  }
  "pci_bucket_2" = {
    bucket_name_prefix = "sr-internal"
    project_id         = "pr-hvpc-1056d88565a4"
    regions            = ["northamerica-northeast1", "us-east4"]
    versioning         = true
    bucket_type        = "pci"
    internal_encryption_config = {
      create_encryption_key = true
      prevent_destroy       = false
    }
    iam_members = [
      {
        role   = "roles/storage.objectUser"
        member = "serviceAccount:b-32-988@pr-hvpc-1056d88565a4.iam.gserviceaccount.com"
      }
    ]
  }
  "pci_bucket_3" = {
    bucket_name_prefix = "sr-3"
    project_id         = "pr-hvpc-1056d88565a4"
    regions            = ["northamerica-northeast1"]
    bucket_type        = "pci"
    internal_encryption_config = {
      create_encryption_key = true
      prevent_destroy       = false
    }
  }
}