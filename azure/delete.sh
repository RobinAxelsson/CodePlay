#!/usr/bin/env bash
# run after setting env. variables

# az mongodb collection delete --account-name "cloud-mongo-db2" --database-name "$datbaseName" --name "$containerName" --resource-group "NET-YH"

### WILL BE DEPRICATED - but works like a charm
# az cosmosdb database delete --db-name $(cat ./databaseName.secret) --name "cloud-mongo-db2" --resource-group-name "NET-YH" --yes

### IN PREVIEW and locks in the process
# az cosmosdb sql database delete --account-name "cloud-mongo-db2" --name $1 --resource-group "NET-YH" --yes # >/dev/null 2>&1

az functionapp delete --name AzureCTF-YH --resource-group NET-YH
