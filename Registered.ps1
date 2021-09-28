function getWinver {
    winver
}

function setWinver {

    $owner = Read-Host "Enter the new owner (press directly enter if you dont want to change it)"
    $organization = Read-Host "Enter the new organization (press directly enter if you dont want to change it)"

    Push-Location
    Set-Location 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion'

    if ($owner) {
        Set-ItemProperty . RegisteredOwner $owner
    }
    
    if ($organization) {
        Set-ItemProperty . RegisteredOrganization $organization
    }

    Pop-Location

    getWinver
    
}

setWinver