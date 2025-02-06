variable "gcp_non_pci_bucket" {
  type = map(object({
    project_id         = string
    project_number     = optional(string)
    bucket_name_prefix = string
    regions            = list(string)
    versioning         = optional(bool, true)
    labels             = optional(map(string), {})
    storage_class      = optional(string, "STANDARD")
    autoclass          = optional(bool, false)
    iam_members = optional(list(object({
      role   = string
      member = string
    })), [])
    retention_policy = optional(object({
      is_locked        = bool
      retention_period = number
    }), null)
    lifecycle_rules = optional(list(object({
      action    = any
      condition = any
    })), [])
    force_destroy            = optional(bool, false)
    public_access_prevention = optional(string, "enforced")
    soft_delete_policy = optional(object({
      retention_duration_seconds = optional(number)
    }), {})
    kms_key_names = optional(map(string), {})
    internal_encryption_config = optional(object({
      create_encryption_key          = optional(bool, false)
      prevent_destroy                = optional(bool, false)
      key_destroy_scheduled_duration = optional(string, null)
      key_rotation_period            = optional(string, "7776000s")
    }), {})
  }))
  default = {}
}

variable "gcp_pci_bucket" {
  type = map(object({
    project_id         = string
    project_number     = optional(string)
    bucket_name_prefix = string
    regions            = list(string)
    versioning         = optional(bool, true)
    labels             = optional(map(string), {})
    storage_class      = optional(string, "STANDARD")
    autoclass          = optional(bool, false)
    iam_members = optional(list(object({
      role   = string
      member = string
    })), [])
    retention_policy = optional(object({
      is_locked        = bool
      retention_period = number
    }), null)
    force_destroy = optional(bool, false)
    soft_delete_policy = optional(object({
      retention_duration_seconds = optional(number)
    }), {})
    kms_key_names = optional(map(string), {})
    internal_encryption_config = optional(object({
      create_encryption_key          = optional(bool, false)
      prevent_destroy                = optional(bool, false)
      key_destroy_scheduled_duration = optional(string, null)
      key_rotation_period            = optional(string, "7776000s")
    }), {})
  }))
  default = {}
}