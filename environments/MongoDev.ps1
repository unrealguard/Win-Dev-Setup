echo "MongoDb Development Mode";

$env:DevEnvironment = "Mongo";

$env:path = $env:DefaultPath;
Append-Path "${env:Bin86Dir}\mongoDb\bin\";

$env:MONGO_HOME = "${env:Bin86Dir}\mongoDb\";
$env:MONGO_DATA = "${env:LOCALAPPDATA}\mongoDb\";

function global:Mongo-Start
{
    $dataDir = "${env:MONGO_DATA}\data\";
    $logFile = "${env:MONGO_DATA }\mongo_log.log";
    if(!(Test-Path $dataDir))
    {
        new-item -type Directory $dataDir;
    }
    $argList = "--dbpath $dataDir", "--logpath $logFile", "--logappend";
    start-process mongod.exe -ArgumentList $argList;
}