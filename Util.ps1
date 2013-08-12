# Utility Functions

function Add-EnvPath
{
	param([String] $folder);
	$env:Path += ";" + $folder;
}

function Remove-EnvPath
{
    param([String] $folder);
	$env:Path += ";" + $folder;
}

New-Alias -Name aep -Value Add-EnvPath;
New-Alias -Name rep -Value Remove-EnvPath;