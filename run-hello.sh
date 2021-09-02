#!/bin/sh
echo --------------------------------
./helloc cArg 2
./hellocpp cppArg 2
mono hello.exe
./hello.zsh zsharg 2
python3 hello.py pyarg 2
# npx ts-node hello.t
node hello.js jsarg 2
dotnet HelloCsharp/bin/Debug/net5.0/publish/HelloCsharp.dll csharpArg 2
dotnet HelloVB/bin/Debug/net5.0/HelloVB.dll vbArg 2
dotnet fsi hello.fsx fsxArg 2
dotnet-script hello.csx -- csxArg 2
java hello.java javarg 2
pwsh hello.ps1 pwshArg 2
