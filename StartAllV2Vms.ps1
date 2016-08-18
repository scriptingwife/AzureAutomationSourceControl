workflow StartAllV2Vms { 
	$Conn = Get-AutomationConnection -Name AzureRunAsConnection 
 	Add-AzureRMAccount -ServicePrincipal -Tenant $Conn.TenantID `
 	-ApplicationId $Conn.ApplicationID -CertificateThumbprint $Conn.CertificateThumbprint

	$VMsv2 = Get-AzureRmVM -ResourceGroupName 'server'
	foreach -Parallel ($vm in $vmsv2)
    	{Start-AzureRmVM -Name $vm.name -ResourceGroupName 'server'}
}