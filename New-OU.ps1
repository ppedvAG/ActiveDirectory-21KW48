[cmdletBinding()] #Laden erweiterterter PowerShell Funktionen
param(
[Parameter(Mandatory=$true)] #Festlegen das der Parameter ein Pflicht Parameter ist der angegeben werden muss. Wenn der vom User nicht angegeben wird, wird der Wert in der PowerShell abgefragt.
$Abteilungsname
)

New-ADOrganizationalUnit -Name:"$Abteilungsname" -Path:"OU=Struktur,DC=ppedv,DC=test" -ProtectedFromAccidentalDeletion:$true -Server:"Server1.ppedv.test"
Set-ADObject -Identity:"OU=$Abteilungsname,OU=Struktur,DC=ppedv,DC=test" -ProtectedFromAccidentalDeletion:$true -Server:"Server1.ppedv.test"
New-ADGroup -GroupCategory:"Security" -GroupScope:"Global" -Name:"GL-$Abteilungsname" -Path:"OU=$Abteilungsname,OU=Struktur,DC=ppedv,DC=test" -SamAccountName:"GL-$Abteilungsname" -Server:"Server1.ppedv.test"
New-ADOrganizationalUnit -Name:"Computer" -Path:"OU=$Abteilungsname,OU=Struktur,DC=ppedv,DC=test" -ProtectedFromAccidentalDeletion:$true -Server:"Server1.ppedv.test"
Set-ADObject -Identity:"OU=Computer,OU=$Abteilungsname,OU=Struktur,DC=ppedv,DC=test" -ProtectedFromAccidentalDeletion:$true -Server:"Server1.ppedv.test"
New-ADOrganizationalUnit -Name:"User" -Path:"OU=$Abteilungsname,OU=Struktur,DC=ppedv,DC=test" -ProtectedFromAccidentalDeletion:$true -Server:"Server1.ppedv.test"
Set-ADObject -Identity:"OU=User,OU=$Abteilungsname,OU=Struktur,DC=ppedv,DC=test" -ProtectedFromAccidentalDeletion:$true -Server:"Server1.ppedv.test"
