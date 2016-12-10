#Validate AD User phone number
#Revise IP address match from module 4
#Demonstrate option matches with ?

#Star quantifer
'expression' -match '.*'

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


$IPAddress = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Ethernet).IPAddress

$IPAddress -match '\d\d\d.\d\d\d.\d.\d\d'

$IPAddress -match '\d+\.\d+.\d.\d+'

$IPAddress -match '\d{3}\.\d{3}\.\d\.\d{1,2}'