echo "JavaScript Dev Mode";

$env:path = $env:DefaultPath;
$env:DevEnvironment = "JS";
Append-Path "${env:ProgramFiles(x86)}\phantomjs\";
Append-Path "${env:ProgramFiles(x86)}\Google\Chrome\Application\";