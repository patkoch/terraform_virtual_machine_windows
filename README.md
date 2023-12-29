# Deployment of a Windows virtual machine on Azure using Terraform

This is the manual for the provisioning of a Windows virtual machine on Azure using Terraform.

# Prerequisites

Despite of having an *Azure* subscription, install following:

 - [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
 - [Terraform](https://developer.hashicorp.com/terraform/downloads)

# Sources for the Terraform configuration

I'd like to refer to following to links, which I've used for for that example:

[Hashicorp - azurerm - Windows Virtual Machine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine)

[Hashicorp - azurerm - public ip](https://registry.terraform.io/providers/hashicorp/azurerm/2.55.0/docs/resources/public_ip)

# Deployment of the Windows virtual machine

I recommend to conduct all commands in VS Code using a new Terminal.

## Login in to Azure

Run following command to start the login to *Azure*:

```
az login
```

A new browser session pops up, use the login credentials of your account:

![alt text](pictures/01_browser_login.png)
<img src="Assets/01_browser_login.png" width="200">

After that, switch back to VS Code, you should see logs similar in the picture shown below:

![alt text](pictures/00_vs_code_az_login.png)

![alt text](pictures/02_vs_code_az_account_show.png)


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
