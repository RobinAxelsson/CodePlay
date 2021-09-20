#!/usr/bin/env bash

# install dotnet-sdk

# dotnet tool install -g dotnet-script
# dotnet tool list -g
# # # dotnet tool uninstall dotnet-script -g

# dotnet script myfile.csx
### runs script files
# dotnet fsi myfile.fsx
### runs fsharp script

# dotnet new sln
# dotnet new console -o <path-proj>
# dotnet new xunit -o <path-test>
# dotnet add ./tests.tests.csproj reference console_main/console_main.csproj
### adds reference to main project from test, needed for intellisense
# dotnet test
### runs all test files

# dotnet run --project console_main/console_main.csproj
### runs and builds project
#dotnet run <path/projectname.dll>