Import-Module ActiveDirectory
$ArquivoSaida="C:\Users\user\resultado.txt"
#Cabeçalho do arquivo de saída
"Computador;Usuario" > $ArquivoSaida
$Computers = Get-ADComputer -filter * -SearchBase "DC=DOMAIN,DC=CORP"
foreach($Computer in $Computers){
$Usuario = ""
"Verificando "+$Computer.name
if (test-connection $Computer.name -count 1 -quiet){
$Usuario =(gwmi -computer $Computer.name -query "select * from Win32_ComputerSystem").UserName
$Resultado=$Computer.name+";"+$Usuario
}else{
$Resultado=$Computer.name+";Sem conexão"
}
#Imprime Resultado
" "+$Resultado
$Resultado >> $ArquivoSaida
}

