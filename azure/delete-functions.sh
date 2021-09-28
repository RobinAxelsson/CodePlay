#!/usr/bin/env bash
# https://docs.microsoft.com/en-us/cli/azure/functionapp?view=azure-cli-latest#az_functionapp_delete
for VAR in "$@"; do
    echo $(az functionapp delete --name $VAR --resource-group NET-YH)
done
