#region Positive_lookahead

'1000' -replace '(?=\d{3}$)',','

#endregion

#region Negative_lookahead_(192.168.20.0/29)

[regex]::Match('192.168.20.11','(\d+\.){3}[1-6]').value

[regex]::Match('192.168.20.11','(\d+\.){3}[1-6](?!\d)').value

#endregion

#region Positive_lookbehind

$t = @"
EventSource[0]:
Address: GDC01.globomantics.com
Enabled: true
EventSource[1]:
Address: GDC02.globomantics.com
Enabled: true
"@

[regex]::matches($t,'(?<=Address:\s+)\w+').value

#endregion

#Negative Lookbehind ?<!

[regex]::Match('duf@fney','\w+(?<!@)').value

[regex]::Match('donotmatch/matchme','(?<!donotmatch\/)matchme').value

[regex]::Match('master\improvement-1.2.0','(?<!master\\)[a-z]+\-([0-9]\.?)+').value

[regex]::Match('master\improvement-1.2.0','(?<!master\\)improvement\-1\.2\.0').value #has restrictions on lenght and no meatacharacters pg132

[regex]::match('http://regex.info/listing.cgi?ed=3&p=all????',`
"http://[a-z0-9]+(\.[a-z0-9]+)*\.(com|edu|info)/[-a-z0-9_:\@&?=+,.!/~*'%\$]*(?<![.,?!])").value

[regex]::match('http://regex.info/listing.cgi?ed=3&p=all',`
"http://[a-z0-9]+(\.[a-z0-9]+)*\.(com|edu|info)/[-a-z0-9_:\@&?=+,.!/~*'%\$]*(?<![.,?!])$").value

#lookahead and lookbehind

$LocalAdmins = net localgroup administrators | Out-String

[regex]::Matches($localadmins,'(?s)(?<=\-\r+\n).*(?=The)').value.trim()


(cmd /c wecutil gs appevents | Out-String) -replace '(?ns)(.*)Address:\s(?<ServerName>\w+)(.*)','$1'
(cmd /c wecutil gs appevents | Out-String) -replace '(?s)(?:.*)Address:\s(\w+)(?:.*)','$1'


#Lookbehind and lookahead (trim whitespaces) try multi line mode

$LocalAdmins = net localgroup administrators | Out-String

$regex = "(?s)(?=\-\r).*(?<!Admins)"

[regex]::Match($LocalAdmins,$regex)

(net localgroup administrators | Out-String) -match '(?s)(?<=\-\r).*(?=The)'

#testing
[regex]::Match($localadmins,'\-+\r+\n\w+').value
[regex]::Match($localadmins,'\-+\r+\n\w+\r+\n\w+').value

#lookbehind
