#region Character_Class_Ranges

#Match any IP within 192.168.20.0/29

#Vaild Host Range = 192.168.20.1 - 192.168.20.6 /29

$IPAddresses = '192.168.20.1','192.168.20.72','192.168.20.3','10.0.0.0'

$IPAddresses -match '192.168.20.[123456]'

#Match any IP within 192.168.20.0/29 with a character class range

$IPAddresses = '192.168.20.1','192.168.20.12','192.168.20.3','10.0.0.0'

$IPAddresses -match '192.168.20.[1-6]'

#Negative Lookahead (Regex Magic)

'192.168.20.12' -match '192.168.20.[123456](?!\d)'

#Find All Users with Last Name Bailey
Get-ADUser -Filter * | Where-Object Name -Match '[a-z]bailey' | select SurName,GivenName

#Replace Invalid Characters in Username
'Eliz[abeth Walker!' -replace  '[][!/\\;|=+<>]+',''

#Case Sensitive Ranges

'REGEX' -cmatch '[a-z]'
'REGEX' -cmatch '[A-Z]'
'REGEX' -cmatch '[a-zA-z]'

#endregion