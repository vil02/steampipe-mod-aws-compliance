locals {
  conformance_pack_eks_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/EKS"
  })
}

control "eks_cluster_secrets_encrypted" {
  title       = "EKS clusters should be configured to have kubernetes secrets encrypted using KMS"
  description = "Ensure if Amazon Elastic Kubernetes Service clusters are configured to have Kubernetes secrets encrypted using AWS Key Management Service (KMS) keys."
  sql         = query.eks_cluster_secrets_encrypted.sql

  tags = merge(local.conformance_pack_eks_common_tags, {
    hipaa = "true"
  })
}

control "eks_cluster_endpoint_restrict_public_access" {
  title       = "EKS clusters endpoint should restrict public access"
  description = "Ensure whether Amazon Elastic Kubernetes Service (Amazon EKS) endpoint is not publicly accessible. The rule is complaint if the endpoint is publicly accessible."
  sql         = query.eks_cluster_endpoint_restrict_public_access.sql

  tags = merge(local.conformance_pack_eks_common_tags, {
    nist_csf = "true"
  })
}

control "eks_cluster_control_plane_audit_logging_enabled" {
  title       = "EKS clusters control panel audit logging should be enabled"
  description = "Amazon EKS control plane audit logging should be enabled. These logs make it easy to secure and run clusters."
  sql         = query.eks_cluster_control_plane_audit_logging_enabled.sql

  tags = merge(local.conformance_pack_eks_common_tags, {
    extra_checks = "true"
  })
}
