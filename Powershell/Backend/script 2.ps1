$tabeau = @( "Laure" , "abdel" , "amadou" , "samuel" , "Nathalie" )
foreach($item in $tabeau)
 { 
 Write-Output $item;
set-location c:\
New-Item -Name $item -ItemType directory
#Get-childitem -Property#
}
Get-childitem c:\
