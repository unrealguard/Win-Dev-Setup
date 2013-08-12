if (Get-Module dev-setup) { return }

Push-Location $psScriptRoot

. .\Util.ps1

Pop-Location

Add-Type -TypeDefinition @"
   public enum DevEnvironmentType
   {
      Default,
      CSharp,
      Broker,
      Node,
	  Git,
	  JavaScript,
      Mongo,
   }
"@;

function Initialize-DevEnvironment
{
	param([DevEnvironmentType] $devType);
	$script = ($psScriptRoot + "\environments\" + $devType.ToString() + "Dev.ps1");
	. $script;
}

# Does nothing initially, but is used to reset the environment after initialization
function Reset-DevEnvironment
{
    
}

New-Alias -Name ide -Value Initialize-DevEnvironment -Description "Initialize Development Environment";


Export-ModuleMember `
    -Alias @(
        'ide') `
    -Function @(
        'Initialize-DevEnvironment',
        'Add-EnvPath',
        'Remove-EnvPath');
    