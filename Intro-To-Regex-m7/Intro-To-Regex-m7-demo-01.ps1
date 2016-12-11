#Star quantifer
'expression!' -match '.*'

'' -match '.*'

#Plus sign quantifer
'expression' -match '\w\w\w\w\w\w\w\w\w\w'

'expression' -match '\w+'

'' -match '\w+'

#Optional matches

'expression','expressions','expressionsss' -match 'expressions?$' 

'expression','expressions','expressionsss' -match 'expressions*'

#Maximum number of matches

(Get-ADUser -Filter * | Where-Object Name -Match '^\w+account').Name

(Get-ADUser -Filter * | Where-Object Name -Match '^\w{3}_\w+').Name

#Minimum and maximum number of matches

$PhoneNumber = (Get-ADUser jgreen -Properties OfficePhone).OfficePhone

$PhoneNumber -match '\d+-\d+-\d+'

$Extension = (Get-ADUser -Identity bbailey -Properties OfficePhone).OfficePhone
$LongDistance = (Get-ADUser -Identity gbailey -Properties OfficePhone).OfficePhone

$Extension,$LongDistance -match '\d?-?\d{3}-\d{3}-\d{4}|\d{3,5}'