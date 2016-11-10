#region Negated_Character_Class

#Find Users Last Name Bailey First Name Not starting with g

Get-ADUser -Filter * | Where-Object Name -Match '[^g]bailey' | select SurName,GivenName

#Match any IP within 192.168.20.0/29

$IPAddresses = '192.168.20.1','192.168.20.12','192.168.20.3','10.0.0.0'

$IPAddresses -match '192.168.20.[^7890]'

#endregion

#region Negated_Character_Class_Ranges  

#Validate Dates

'01-04-1990' -match '[0-9][0-9][^ ][0-9][0-9][^ ][0-9][0-9][0-9][0-9]'

'01/04/1990' -match '[0-9][0-9][^ ][0-9][0-9][^ ][0-9][0-9][0-9][0-9]'

'01 04 1990' -match '[0-9][0-9][^ ][0-9][0-9][^ ][0-9][0-9][0-9][0-9]'

#Spliting  Usernames

('ewalker@globomantics.com' -split '[^a-z]')

('ewalker@globomantics.com' -split '[^a-z]')[0]

('Elizabeth Walker' -split '[^a-z]')

#endregion