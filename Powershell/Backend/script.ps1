Get-Childitem 
set-location "c:\"
New-Item -Name "Dossier1" -ItemType directory
New-Item -Name "fichier1.txt" -Itemtype file -Value "Test"
Get-Childitem 
