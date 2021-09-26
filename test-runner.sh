#!/usr/bin/env bash
export TestUrl="http://localhost:8080/"

echo --------Making requests------------
echo "---xunit-------->"
echo "dotnet test"
dotnet test
echo "---csx---------->"
echo "dotnet script request.csx"
dotnet script request.csx
echo "---powershell--->"
echo "pwsh request.ps1"
pwsh request.ps1
echo "---python------->"
echo "python3 request.py"
python3 request.py
echo "---curl/bash---->"
echo "bash request.sh"
bash request.sh

unset TestUrl
