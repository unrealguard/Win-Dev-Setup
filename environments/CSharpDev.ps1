echo "C# Development Mode";

$env:path = $env:DefaultPath;
$env:DevEnvironment = "C#";
Append-Path "${env:ProgramFiles(x86)}\nant-0.92\bin\";
Append-Path "${env:windir}\Microsoft.NET\Framework\v4.0.30319\"; 
Append-Path "${env:ProgramFiles(x86)}\nuget\";