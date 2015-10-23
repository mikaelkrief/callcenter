param
(
	[String]$siteName,
	[String]$titleToReplace
)

Write-Verbose -Verbose $titleToReplace
Write-Verbose -Verbose $siteName

$site = Get-AzureWebsite -Name $siteName
$site.AppSettings["Title"] = $titleToReplace
Set-AzureWebsite $site.Name -AppSettings $site.AppSettings
