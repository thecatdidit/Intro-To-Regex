#region Character_Class 

#Simple character class example
'gray' -match 'gray'

'grey' -match 'gray'

'gray','grey' -match 'gr[ae]y'

#Using select string to find multiple matches
'gray & grey' | sls 'gr[ae]y' -all | % Matches

#Character classes to find AD cmdlets
Get-Command -Module ActiveDirectory

Get-Command -Module ActiveDirectory | Where-Object Name -Match 'Get-'

Get-Command -Module ActiveDirectory | Where-Object Name -Match 'Set-'

Get-Command -Module ActiveDirectory | Where-Object Name -Match '[GS]et-'

(gcm -Module ActiveDirectory | Where-Object Name -Match 'Get-').count + `
(gcm -Module ActiveDirectory | Where-Object Name -Match 'Set-').count -eq `
(gcm -Module ActiveDirectory | Where-Object Name -Match '[GS]et-').count

#endregion

#region Character_Class_Ranges

#Match any IP within 192.168.20.0/29
$IPAddresses = '192.168.20.1','192.168.20.2','192.168.20.3','192.168.20.4','192.168.20.5','192.168.20.6'

$IPAddresses -match '192.168.[0123456789][0123456789].[0123456789]'

#Match any IP within 192.168.20.0/29 with character class ranges

$IPAddresses = '192.168.20.1','192.168.20.2','192.168.20.3','192.168.20.4','192.168.20.5','192.168.20.6'

$IPAddresses -match '192.168.[0-9][0-9].[0-9]'

#Matching MacAddresses

'svc_jenkins' -match '[a-z][a-z]'
'' -match '[a-z][a-z]'  

#endregion 