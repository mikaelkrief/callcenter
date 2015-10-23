param
(
	[String] $TrafficManagerProfileName,
	[Int] $Operation
)

Write-Verbose -Verbose "Getting profile for $TrafficManagerProfileName"
$trprofile = Get-AzureTrafficManagerProfile -Name $TrafficManagerProfileName
Write-Verbose -Verbose $trprofile.DomainName
Write-Verbose -Verbose "Performing Operation $Operation"
if ($Operation -eq 0) {
# Disable Endpoint[0]
$trprofile.Endpoints[0].Status = "Disabled"
} elseif ($Operation -eq 1) {
# Enable Endpoint[0] & Disable Endpoint[1]
$trprofile.Endpoints[0].Status = "Enabled"
$trprofile.Endpoints[1].Status = "Disabled"
} else {
# Enable both Endpoints
$trprofile.Endpoints[0].Status = "Enabled"
$trprofile.Endpoints[1].Status = "Enabled"
}
Write-Verbose -Verbose "Setting profile for $TrafficManagerProfileName"
Set-AzureTrafficManagerProfile -TrafficManagerProfile $trprofile

