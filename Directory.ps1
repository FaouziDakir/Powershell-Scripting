Function Write-ErrorLog {
[CmdletBinding()]
param (

    [Parameter(Mandatory=$false,
                HelpMessage="Error from computer.")] 
    [switch]$size
)
BEGIN { 
        
        $arr = Get-ChildItem | Where-Object {$_.PSIsContainer} | Foreach-Object {$_.Name}
        $tab = New-Object System.Collections.Generic.List[System.Object]
}
PROCESS {  

                Foreach ($each in $arr)
                {

                    Push-Location
                    cd $each

                    if($PSBoundParameters.ContainsKey('size')){

                        $sizeFiles = (Get-ChildItem -Recurse | Measure-Object -Property Length -Sum | Select-Object Sum)
                        $sizeFiles = $sizeFiles.Sum
                        $tab.Add("$each[$sizeFiles]")

                    } else {

                        $count = (Get-ChildItem -File | Measure-Object).Count
                        $tab.Add("$each[$count]")
        
                    }
                    
                    Pop-Location

                }

                $tab | Format-Wide {$_} -AutoSize -Force
            
            
}        
END { 

}
}

Write-ErrorLog
#Write-ErrorLog -size