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

# Deploy and destroy the Windows virtual machine with Terraform

I recommend to conduct all commands in VS Code using a new Terminal.

## Login in to Azure

Run following command to start the login to *Azure*:

```
az login
```

A new browser session pops up, use the login credentials of your account:

<img src="pictures/01_browser_login.png" width="400">

After that, switch back to VS Code, you should see logs similar in the picture shown below:

<img src="pictures/00_vs_code_az_login.png" width="800">

You can prove whether you are using the right subscription using the following command:

```
az account show
```
This shows you the current subscription:

<img src="pictures/02_vs_code_az_account_show.png" width="400">

## Deploy the virtual machine 

The first *Terraform* command is the "init" command:

```
terraform init
```
The logs in the picture below show a successful execution of the command:

<img src="pictures/03_vs_code_terraform_init.png" width="400">

As next, run the "format" command, to ensure that all files of your configuration stick to specific language style conventions:

```
terraform fmt
```

After that, ensure that your *Terraform* coniguration is valid by executing:

```
terraform validate
```

<img src="pictures/05_vs_code_terraform_validate.png" width="400">

Create now a *Terraform* plan file, by running:

```
terraform plan -out tfplan
```
This creates a file named "tfplan" in your directory:

<img src="pictures/06_vs_code_terraform_plan.png" width="500">

Finally, the command can be executed for deploying the virtual machine on *Azure* - it uses the *Terraform* plan named "tfplan" as an argument:

```
terraform apply "tfplan"
```

<img src="pictures/07_vs_code_terraform_apply.png" width="400">

The deployment was successful if following log message appears:

<img src="pictures/08_vs_code_apply_complete.png" width="400">

Prove the deployment of the virtual machine in the *Azure* portal:

<img src="pictures/09_azure_portal_vm.png" width="800">

## Destroy the virtual machine

The virtual machine can be destroyed using the following command:

```
terraform destroy
```

<img src="pictures/10_vs_code_terraform_destroy.png" width="400">

# References

https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build

https://developer.hashicorp.com/terraform/cli/commands
