# Ask the user for the domain name
$domainName = Read-Host "Enter the domain name (e.g., DomainName.local)"

# Promote the server to a domain controller using the provided domain name
Install-ADDSForest `
    -DomainName $domainName `
    -DomainNetbiosName ($domainName.Split(".")[0]) `
    -ForestMode "WinThreshold" `
    -DomainMode "WinThreshold" `
    -InstallDns:$true `
    -NoRebootOnCompletion:$false `
    -Force:$true

# Wait for 60 seconds
Start-Sleep -Seconds 60

# Restart the computer
Restart-Computer
