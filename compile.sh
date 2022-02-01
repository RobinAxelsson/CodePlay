#!/bin/bash
gcc hello.c -o helloc
g++ hello.cpp -o hellocpp
ilasm hello.il
dotnet publish ./HelloCsharp/HelloCsharp.csproj
dotnet publish ./HelloVB/HelloVB.vbproj
