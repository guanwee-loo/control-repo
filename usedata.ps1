<powershell>
Add-Content -Path $env:windir\System32\drivers\etc\hosts -Value "`n172.31.20.0`tec2-13-229-82-223.ap-southeast-1.compute.amazonaws.com" -Force;
[System.Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; [Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}; $webClient = New-Object System.Net.WebClient; $webClient.DownloadFile('https://ec2-13-229-82-223.ap-southeast-1.compute.amazonaws.com:8140/packages/current/install.ps1', 'install.ps1'); .\install.ps1 -v
</powershell>

fiZk.uN4-xCvQaixiAoWbv3oyzbH7D!sJjhPLPrWF3*Rgg@*LWZ