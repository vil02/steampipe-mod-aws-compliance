locals {
  conformance_pack_efs_common_tags = {
    service = "efs"
  }
}

control "efs_file_system_encrypt_data_at_rest" {
  title       = "EFS file system encryption at rest should be enabled"
  description = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elastic File System (EFS)."
  sql         = query.efs_file_system_encrypt_data_at_rest.sql

  tags = merge(local.conformance_pack_efs_common_tags, {
    hipaa              = "true"
    rbi_cyber_security = "true"
  })
}