"10.0.0.7 puppetent.rf5ltfv2bwtuzb53jl1202hspb.fx.internal.cloudapp.net" | Out-File -Encoding UTF8 -Append C:\Windows\System32\drivers\etc\hosts

[System.Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; 
[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}; 

$webClient = New-Object System.Net.WebClient; 
$webClient.DownloadFile('https://puppetent.rf5ltfv2bwtuzb53jl1202hspb.fx.internal.cloudapp.net:8140/packages/current/install.ps1', 'install.ps1'); 

.\install.ps1 -v
