# Terraform Cloud Examples

This repository contains separate Terraform examples for AWS, Azure, and Google Cloud. Each service directory is an independent configuration; initialize and operate it from that directory with credentials and project/subscription context configured outside the repository.

## Directory structure

```text
aws/       ec2, eks, iam, s3, vpc
azure/     aks, iam, storage, vm, vnet
gcp/       compute, gke, iam, storage, vpc
```

The original AWS examples are under `aws/`. The EKS example includes its VPC, subnets, and IAM role as in the original. `aws/main.tf` retains the original S3 module scaffold; its module source and bucket-name values are placeholders and must be adapted before use.

## Resource mapping

| Existing AWS example | Azure example | Google Cloud example |
| --- | --- | --- |
| EC2 instance | Linux VM (`azurerm_linux_virtual_machine`) | Compute Engine instance (`google_compute_instance`) |
| S3 bucket | Storage account and private blob container | Cloud Storage bucket |
| IAM user | User-assigned managed identity | Service account |
| VPC, public/private subnets, NAT and VPN gateways | Virtual network, subnets, NAT gateway and VPN gateway | VPC, subnets, Cloud NAT and HA VPN gateway |
| EKS cluster, VPC/subnets and cluster IAM role | AKS cluster with system-assigned identity | GKE cluster with VPC/subnet and node pool |

The IAM examples represent workload identities, not human-user provisioning: AWS IAM users, Azure managed identities, and Google service accounts have different lifecycle and permission models. The EKS/Azure/GCP cluster examples use each provider's native cluster identity and networking behavior; they are not exact resource-for-resource replicas.

## Using the examples

Select one service directory and use it as a standalone Terraform working directory. Configure cloud authentication through the provider's supported environment, CLI login, or local profile; do not commit credentials, state, plan files, or variable files. Google Cloud examples require a `project_id` input. The Azure VM requires an SSH public key, and Azure Storage requires a globally unique storage account name. The GCP storage bucket and Azure network gateways also require globally available or regionally supported names and services.

Provider constraints are declared in each example. The AWS examples retain their existing AWS provider constraint (`~> 3.27`); Azure uses `~> 3.0`, and Google Cloud uses `~> 5.0`. Review provider documentation and regional availability before deploying, especially for managed Kubernetes and VPN gateway resources.