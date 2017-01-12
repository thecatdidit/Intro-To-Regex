#region PhoneNumber

'202-555-0148' -match '(?x) (?<AreaCode>\d{3}) - (?<PhoneNumber>\d{3}-\d{4})'

#endregion

#region Windows_Event_Forwarding

$regex = '(?xn) #modifers
          (Address:\s)
          (?<ServerName>\w+) #1st named capture
          \.
          (?<Domain>\w+.com) #2nd named capture'

$eventSub = (cmd /c wecutil gs appevents | Out-String)

$eventSub -match $regex

#endregion

#region Create_Objects_from_Named_Captures

[regex]$regexObj = $regex

$keys = $regexObj.GetGroupNames() | Where-Object {$_ -match '(?i)[a-z]{2,}'}

$regexObj.Matches($eventSub) | % {
    $match = $_
    $keys | % -Begin {$hash=[ordered]@{}} -Process {
        $hash.add($_,$match.groups["$_"].value)
    } -End { [PSCustomObject]$hash}
}

#endregion

#region EventLog_Messages

$eventlog = Get-EventLog -InstanceId 4720 -LogName Security | select -First 1

$regex = '(?xns) #modifers
          Subject:(.*)
          Account\s+Name:\s+(?<DomainController>[a-z0-9]+)
          (.*)New\s+Account:(.*)
          Account\s+Name:\s+(?<AccountName>[a-z_]+)
          (.*)Account\s+Domain:\s+
          (?<Domain>[a-z]+)'

$eventlog.Message -match $regex


#endregion