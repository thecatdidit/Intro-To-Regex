Type | Regex | Successful if the enclosed subexpression...
--- | --- | ---
Positive Lookbehind | (?<=) | Successful if can match to the left
Negative Lookbehind | (?<\!) | Successful if can not match to the left
Positive Lookahead | (?=) | Successful if can match to the right
Negative Lookahead | (?!) | Successful if can not match to the right 

[regex]::match('http://regex.info/listing.cgi?ed=3&p=all????',`
"http://[a-z0-9]+(\.[a-z0-9]+)*\.(com|edu|info)/[-a-z0-9_:\@&?=+,.!/~*'%\$]*(?<![.,?!])").value

[regex]::match('http://regex.info/listing.cgi?ed=3&p=all',`
"http://[a-z0-9]+(\.[a-z0-9]+)*\.(com|edu|info)/[-a-z0-9_:\@&?=+,.!/~*'%\$]*(?<![.,?!])$").value

(cmd /c wecutil gs appevents | Out-String) -replace '(?ns)(.*)Address:\s(?<ServerName>\w+)(.*)','$1'
(cmd /c wecutil gs appevents | Out-String) -replace '(?s)(?:.*)Address:\s(\w+)(?:.*)','$1'