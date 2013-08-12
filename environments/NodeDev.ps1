echo "Node Development Mode";

$env:DevEnvironment = "Node";

$env:path = $env:DefaultPath;
Append-Path "${env:Bin86Dir}\node\";