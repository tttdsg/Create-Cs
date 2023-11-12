function New-Cs {

 Param (
 [Parameter(Position=0,mandatory=$true)][string]$Name,
 [string]$Path,
 [string]$MainPath
 )

    $UserPath = "$env:UserProfile"
    
 if ($MainPath -ne ""){

    Export-Clixml -InputObject $MainPath -Path "$Userpath\Documents\PowerShell\Modules\createcs\MainPath.clixml"
 } 

    $tp = Test-Path -Path "$Userpath\Documents\PowerShell\Modules\createcs\MainPath.clixml"

 if ($Path -eq ""){

    if ($tp -eq $false) {

        $Path = [string](Read-Host -Prompt "Please enter the desired path: ")
    }

    Else {

        $Path = Import-Clixml -Path "$Userpath\Documents\PowerShell\Modules\createcs\MainPath.clixml"
    }

 }
 
 New-Item -ItemType Directory -Path "$Path" -Name "$name"

 Set-Location "$Path\$name"
 
 dotnet new console 

}
