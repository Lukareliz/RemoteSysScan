do {
    Clear-Host
    
    
    $NOME_DO_COMPUTADOR = Read-Host "Digite o nome do computador"
    
    Write-Output "Executando comandos para o computador: $NOME_DO_COMPUTADOR"
    Write-Output ""
    
    Write-Output "Usuarios conectados ao computador:"
    query user /server:$NOME_DO_COMPUTADOR
    Write-Output ""
    
    Write-Output "Fabricante e modelo do sistema:"
    Get-CimInstance -ClassName Win32_ComputerSystem -ComputerName $NOME_DO_COMPUTADOR | Select-Object Manufacturer, Model | Format-Table -AutoSize
    Write-Output ""
    
    Write-Output "Informacoes do processador:"
    Get-CimInstance -ClassName Win32_Processor -ComputerName $NOME_DO_COMPUTADOR | Select-Object Name, NumberOfCores, MaxClockSpeed | Format-Table -AutoSize
    Write-Output ""
    
    Write-Output "Informacoes da memoria:"
    Get-CimInstance -ClassName Win32_PhysicalMemory -ComputerName $NOME_DO_COMPUTADOR | Select-Object Capacity | Format-Table -AutoSize
    Write-Output ""
    
    Write-Output "Informacoes do disco rigido:"
    Get-CimInstance -ClassName Win32_DiskDrive -ComputerName $NOME_DO_COMPUTADOR | Select-Object Model, Size | Format-Table -AutoSize
    Write-Output ""
    
    Write-Output "Informacoes da placa-mae:"
    Get-CimInstance -ClassName Win32_BaseBoard -ComputerName $NOME_DO_COMPUTADOR | Select-Object Product, Manufacturer | Format-Table -AutoSize
    Write-Output ""
    
    Write-Output "Informacoes do sistema operacional:"
    Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $NOME_DO_COMPUTADOR | Select-Object Caption, Version, OSArchitecture | Format-Table -AutoSize
    Write-Output ""
    
    Write-Output "Numero de serie do BIOS:"
    Get-CimInstance -ClassName Win32_BIOS -ComputerName $NOME_DO_COMPUTADOR | Select-Object SerialNumber | Format-Table -AutoSize
    Write-Output ""
    
    Write-Output "Endereco MAC do computador:"
    Get-CimInstance -ClassName Win32_NetworkAdapter -ComputerName $NOME_DO_COMPUTADOR | Where-Object { $_.NetEnabled -eq $true } | Select-Object MACAddress | Format-Table -AutoSize
    Write-Output ""
    
    Write-Output "======================================"
    Write-Output "Deseja pesquisar outro computador?"
    Write-Output "[1] Sim"
    Write-Output "[2] Nao (Sair)"
    Write-Output "======================================"
    $OPCAO = Read-Host "Digite sua escolha"
} while ($OPCAO -eq "1")