
$env:DevEnvironment = "Git";
aep "${env:Bin86Dir}\Git\cmd\";

function global:Git-Bash
{
    $gitbash = "${env:Bin86Dir}\Git\git-bash";
    & $gitbash
}

if(Get-Module -ListAvailable | Where-Object {$_.Name -eq "posh-git"})
{
    import-module posh-git
    Enable-GitColors
}

function global:prompt {
    $host.ui.rawui.BackgroundColor = $env:OrigBgColor
    $host.ui.rawui.ForegroundColor = $env:OrigFgColor
    
    $realLASTEXITCODE = $LASTEXITCODE

	$pwd = get-location
	$array = $pwd.Path.split('\')
	if($array.length -gt 4)
	{
		$path = '';
		$arrayLength = $array.length

		$keepers = (0, ($arrayLength - 2), ($arrayLength -1));
		for($i = 0; $i -lt $arrayLength; $i++)
		{
			switch ($i)
			{
				{$keepers -contains $i} {$path += $array[$i] + "\"}
				{1 -contains $_} {$path += $array[$i] + "\...\"}
			}
		}
		Write-Host -NoNewline ($env:DevEnvironment + " " + $path);
	}
	else
	{
		Write-Host -NoNewline ($env:DevEnvironment + " " + $(get-location));
	}
    
    if(Get-Module -ListAvailable | Where-Object {$_.Name -eq "posh-git"})
    {
        # Reset color, which can be messed up by Enable-GitColors
        $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor
        Write-VcsStatus
    }

    $global:LASTEXITCODE = $realLASTEXITCODE
    return ">"
}

