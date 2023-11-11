Win-Dev-Setup
=============

Windows development environment bootstrapping repository.


Setup Steps:

1. Install Chocolately From Admin Powershell Terminal

See here (https://chocolatey.org/install) for details or run below:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = `
[System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 

$url = 'https://community.chocolatey.org/install.ps1';
iex ((New-Object System.Net.WebClient).DownloadString($url))
```


2. Install Git

```
choco install git `
--params "'/NoShellIntegration `
           /WindowsTerminal `
           /DefaultBranchName:main `
           /SChannel'";
```

3. Clone this repository


4. Install Windows Subsystem For Linux (WSL)

```
wsl --install
```

5. Install Chocolately Packages

```
choco install packages.config
```