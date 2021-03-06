Import-Module ActiveDirectory
Import-Module NTFSSecurity
$Users = Import-Csv -Delimiter ";" -Path "C:\Users\Administrateur\Desktop\userliste.csv"
foreach ($User in $Users)  
{  
    $OU = "OU=PROPAN,DC=PROPAN,DC=local"
    $Password = $User.password 
    $Detailedname = $User.firstname + " " + $User.name 
    $UserFirstname = $User.Firstname 
    $FirstLetterFirstname = $UserFirstname.substring(0,1) 
    $SAM = $FirstLetterFirstname + $User.name
    $Profilepath = $User.Profilpath + $SAM
    $homeDirectory = $User.homeDirectory + $SAM
    $homeDrive = $User.homeDrive
    $FolderProfile = "C:\profiles\"
    $HomeFolder = "C:\home\"
    $AclPath = "C:\home\" + $SAM
    $AclPathProfiles = $FolderProfile + $SAM
    $Account = "PROPAN\" + $SAM
New-ADUser -Name $Detailedname -SamAccountName $SAM -UserPrincipalName $SAM -DisplayName $Detailedname -GivenName $user.firstname -Surname $user.name -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Profilepath $Profilpath -homeDirectory $homeDirectory -homeDrive $homeDrive -Enabled $true -Path $OU
If (-not (Test-Path "$HomeFolder + $SAM")) { New-Item -ItemType Directory -Name $SAM -Path $HomeFolder} else {Write-Output "Le fichier $SAM existe deja!"}
If (-not (Test-Path "$FolderProfile + $SAM")) { New-Item -ItemType Directory -Name $SAM -Path $FolderProfile} else {Write-Output "Le fichier $SAM existe deja!"}
Add-NTFSAccess -Path $AclPath -Account $Account -AccessRights FullControl
Add-NTFSAccess -Path $AclPathProfiles -Account $Account -AccessRights FullControl

}

$properties = �ProfilePath�,�ScriptPath�, �l�
Get-ADUser -Filter * -SearchBase $OU -Properties $properties |
ForEach-Object {

 $ProfilePath = �\\AD-PRO-1\profiles\{1}� -f $_.l, $_.SamAccountName
 $ScriptPath = �netmaplogon.cmd� -f $_.l
 Set-ADUser $_.samaccountname -ProfilePath $ProfilePath -ScriptPath $ScriptPath
}