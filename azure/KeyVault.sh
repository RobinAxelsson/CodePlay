#!/usr/bin/env bash

### Create managed resources
# https://docs.microsoft.com/en-us/azure/app-service/overview-managed-identity?tabs=dotnet

### Create Resource Group
# az group create --name "myResourceGroup" -l "EastUS"

### Create Keyvault
# az keyvault create --name "<your-unique-keyvault-name>" --resource-group "myResourceGroup" --location "EastUS"

### Create Secret
# az keyvault secret set --name MySecretName --vault-name MyKeyVault --value MyVault

### Get secret
# az keyvault secret show --id "https://linkmanagement.vault.azure.net/secrets/UserName" | grep \"id\"

### USE refs-get.sh, refs-set.sh ###
# az functionapp config appsettings set -g NET-YH -n AzureCTF-YH4 --settings "@Microsft.KeyVault"
# az functionapp config appsettings list --name AzureCTF-YH4 --resource-group NET-YH
# az functionapp config appsettings set -g "NET-YH" -n "AzureCTF-YH4" --settings TEST=TEST
