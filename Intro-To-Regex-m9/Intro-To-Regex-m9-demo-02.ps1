#region Named_Caputres_In_Action

#phone nubmer

'202-555-0148' -match '(?x) (?<AreaCode>\d{3}) - (?<PhoneNumber>\d{3}-\d{4})'

#x modifer to add comments to regex and multi line expression (ignore whitespaces)

$regex = '(?xn) #modifer
          (Address:\s)
          (?<ServerName>\w+) #1st named capture
          \.
          (?<Domain>\w+.com) #2nd named capture'

$eventSub = (cmd /c wecutil gs appevents | Out-String)

$eventSub -match $regex

#creating object from named captures

[regex]$regexObj = $regex

$keys = $regexObj.GetGroupNames() | Where-Object {$_ -match '(?i)[a-z]{2,}'}

$regexObj.Matches($eventSub) | % {
    $match = $_
    $keys | % -Begin {$hash=[ordered]@{}} -Process {
        $hash.add($_,$match.groups["$_"].value)
    } -End { [PSCustomObject]$hash}
}


#capture event log message Use [regex]

#endregion