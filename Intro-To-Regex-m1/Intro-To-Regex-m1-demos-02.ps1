#region Literal_Regex_Matching

#Matching a ServerName from a UNC Path
'\\GFS-01\Share\regex.ps1' -match 'GFS-01'

$Matches

'\\ServerName\Share\regex.ps1' | Select-String -Pattern 'ServerName'

$Matches

#Finding .ps1 files with Where-Object
Get-ChildItem | Where-Object Name -Match '.ps1'

#Searching user's managers in Active Directory 
Get-ADUser -Filter * -Properties Manager | Where-Object Manager -match 'smith'

#Matching a user name within a distinguished name
'CN=Administrator,CN=Users,DC=globomantics,DC=com' -match 'Administrator'

$Matches
$Matches[0]

#Determine domain name from distinguished name
'cn=Administrator,cn=users,dc=globomantics,dc=com' -match 'globomantics,dc=com'

$Matches[0] -replace ',dc=','.'

#endregion