https://medium.com/cs-nerds/c-scripting-with-vscode-a-recipe-c672dd44d6

```sh
dotnet script helloworld.csx
```
```sh
dotnet script init
```

Add shebang and nuget packet reference
```csharp
#!/usr/bin/env dotnet-script
#r "nuget: Bogus, 33.1.1"
```
reference:
https://www.elliotdenolf.com/posts/csharp-scripting-using-dotnet-script/