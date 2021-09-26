#!/usr/bin/env pwsh
$r=Invoke-WebRequest http://localhost:8080/hello
$r.RawContent