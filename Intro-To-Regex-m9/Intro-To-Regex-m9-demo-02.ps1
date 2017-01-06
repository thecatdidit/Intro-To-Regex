$string = 'abc
123' | Out-String

$text = @"
abc
123
"@

[regex]$rx='(?m)^(?<word>[a-z]+)$'
[regex]$rx='(?m)^(?<word>[a-z]+$) ^(?<num>[0-9]+$)'


$services = Get-Content .\services.txt
[regex]$rx='(?m)^(?:(?<Status>Stopped|Running)$) ^(?<name>[a-z0-9]+)$'
$rx.Matches($services)


#named and numbered captures not recommended

'aaa 123 bbb 456' -match "(?<word>\w{3}) (?<num>\d{3})"
[regex]$rx="(?<word>\w{3}) (?<num>\d{3})"
$m = $rx.Match('aaa 123 bbb 456')
$rx.GetGroupNames()

#phone nubmer
'202-555-0148' -match '(?<AreaCode>\d{3})-(?<PhoneNumber>\d{3}-\d{4})'

#user and domain name
'CN=Administrator,CN=Users,DC=globomantics,DC=com' -match 'CN=(?<UserName>)\w+)'


$DistinguishedName -replace "(?:.*)?DC=(.*),DC=(com|net)",'$1.$2'

#capture event log message

#event forwarding log collection (multi line)