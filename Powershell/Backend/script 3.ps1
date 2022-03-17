$mmir=@("larby", "jack")

foreach ($eleve in $mmir) {
New-Item -Path c :\ -Name $eleve -ItemType Directory
}
sleep 2
echo $eleve
sleep 1
gci c:\ | Where-Object -Property Name -eq $eleve