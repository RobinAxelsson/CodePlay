#!/bin/sh

# RID
# osx.11.0-x64
# osx.11.0-arm64
dotnet publish ./HelloCsharp/HelloCsharp.csproj
#dotnet publish -c Release -r <RID> --self-contained true
#dotnet publish ./HelloCsharp/HelloCsharp.csproj -c Release -r osx.11.0-x64 --self-contained true
#dotnet publish ./HelloCsharp/HelloCsharp.csproj -r osx.11.0-x64 /p:PublishSingleFile=true /p:IncludeNativeLibrariesForSelfExtract=true --self-contained true
