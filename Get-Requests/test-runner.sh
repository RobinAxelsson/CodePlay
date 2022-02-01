#!/usr/bin/env bash
#export TestUrl="http://localhost:8080/"

echo --------Making requests------------
# echo "---xunit-------->"
# echo "dotnet test"
# dotnet test
echo "---csx---------->"
dotnet script request.csx
echo "---powershell--->"
pwsh request.ps1
echo "---python------->"
python3 request.py
echo "---js/nodejs---->"
node request.js
echo "---curl/bash---->"
bash request.sh

#unset TestUrl
