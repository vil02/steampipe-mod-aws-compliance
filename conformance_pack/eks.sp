locals {
  conformance_pack_eks_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/EKS"
  })
}

control "eks_cluster_secrets_encrypted" {
  title       = "EKS clusters should be configured to have kubernetes secrets encrypted using KMS"
  description = "Ensure if Amazon Elastic Kubernetes Service clusters are configured to have Kubernetes secrets encrypted using AWS Key Management Service (KMS) keys."
  query       = query.eks_cluster_secrets_encrypted

  tags = merge(local.conformance_pack_eks_common_tags, {
    audit_manager_pci_v321_requirement_3 = "true"
    gxp_eu_annex_11                      = "true"
    hipaa                                = "true"
  })
}

control "eks_cluster_endpoint_restrict_public_access" {
  title       = "EKS clusters endpoint should restrict public access"
  description = "Ensure whether Amazon Elastic Kubernetes Service (Amazon EKS) endpoint is not publicly accessible. The rule is compliant if the endpoint is publicly accessible."
  query       = query.eks_cluster_endpoint_restrict_public_access

  tags = merge(local.conformance_pack_eks_common_tags, {
    audit_manager_pci_v321_requirement_1 = "true"
    audit_manager_pci_v321_requirement_2 = "true"
    audit_manager_pci_v321_requirement_7 = "true"
    nist_800_171_rev_2                   = "true"
    nist_csf                             = "true"
  })
}

control "eks_cluster_control_plane_audit_logging_enabled" {
  title       = "EKS clusters should have control plane audit logging enabled"
  description = "Amazon EKS clusters should have control plane audit logging enabled. These logs make it easy to secure and run clusters."
  query       = query.eks_cluster_control_plane_audit_logging_enabled

  tags = merge(local.conformance_pack_eks_common_tags, {
    other_checks = "true"
  })
}

control "eks_cluster_no_default_vpc" {
  title       = "EKS clusters should not be configured within a default VPC"
  description = "Ensure to configure a new VPC for your EKS cluster as default VPC comes with a default configuration that lacks the proper security controls. Your network should be well configured and should follow the least privilege principle, meaning only the necessary privileges are granted."
  query       = query.eks_cluster_no_default_vpc

  tags = merge(local.conformance_pack_eks_common_tags, {
    other_checks = "true"
  })
}

control "eks_cluster_with_latest_kubernetes_version" {
  title         = "EKS clusters should run on a supported Kubernetes version"
  description   = "This control checks whether an Amazon EKS cluster is running on a supported Kubernetes version. The control fails if the EKS cluster is running on an unsupported version. If your application doesn't require a specific version of Kubernetes, we recommend that you use the latest available Kubernetes version that's supported by EKS for your clusters."
  query         = query.eks_cluster_with_latest_kubernetes_version

  tags = merge(local.foundational_security_eks_common_tags, {
    audit_manager_pci_v321_requirement_6 = "true"
  })
}