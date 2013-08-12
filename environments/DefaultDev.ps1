echo "Default Development Mode";

$env:DevEnvironment = "PS";

aep "${env:Bin86Dir}\7za\";


function global:prompt
{
    $host.ui.rawui.BackgroundColor = $env:OrigBgColor
    $host.ui.rawui.ForegroundColor = $env:OrigFgColor
    
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
	
	return ">";
}