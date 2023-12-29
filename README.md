# Deployment of a Windows virtual machine on Azure using Terraform

This is the manual for the provisioning of a Windows virtual machine on Azure using Terraform.

# 1. Prerequisites

Despite of having an *Azure* subscription, install following:

 - [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
 - [Terraform](https://developer.hashicorp.com/terraform/downloads)

# Sources for the Terraform configuration

I'd like to refer to following to links, which I've used for for that example:

[Hashicorp - azurerm - Windows Virtual Machine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine)

[Hashicorp - azurerm - public ip](https://registry.terraform.io/providers/hashicorp/azurerm/2.55.0/docs/resources/public_ip)

# Deployment of the Windows virtual machine

## Initialization

Use the Init command for establishing a connection to the backend, use:

```
terraform init
```

## Validation

Use the Validation command for verifying the file

```
terraform validation
```

## Apply

Use the Apply command for conducting the provisioning

```
terraform apply
```
