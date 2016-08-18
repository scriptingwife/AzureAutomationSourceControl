workflow StopAllV2Vms
{
    $Conn = Get-AutomationConnection -Name AzureRunAsConnection 
 	Add-AzureRMAccount -ServicePrincipal -Tenant $Conn.TenantID `
 	-ApplicationId $Conn.ApplicationID -CertificateThumbprint $Conn.CertificateThumbprint

	$VMsv2 = Get-AzureRmVM
	foreach -parallel ($vm in $vmsv2)
    	{Stop-AzureRmVM -Name $vm.name -ResourceGroupName 'server' -Force}
}