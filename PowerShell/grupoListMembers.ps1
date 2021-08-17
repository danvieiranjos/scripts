
# https://docs.microsoft.com/pt-br/powershell/module/exchange/get-distributiongroup?view=exchange-ps


Connect-MsolService -Credential $UserCredential

Get-DistributionGroupMember -Identity "grupo@emprexa.net" | export-csv C:\user\danilo.anjos\operationall.csv


Get-DistributionGroupMember -Identity "Grupo" | Select Name, PrimarySmtpAddress | Export-csv members.csv -NoTypeInformation





