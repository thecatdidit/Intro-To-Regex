#region Named_Captures

'abcd 1234' -match '(?<word>\w+) (?<num>\d+)'

'Stopped BITS' -match '(?:(?<Status>Stopped|Running)) (?<Name>[a-z0-9]+)'

#endregion

#region Regex_Object

$string = 'abcd 1234 efg 567'

[regex]$regex = '(?<word>\w+) (?<num>\d+)'

$regex.Match($string)

$string = 'abcd 1234 efg 567'

$regex.Matches($string)

$m = $regex.Matches($string)
$m | ForEach-Object {$_.groups["word"].value}
$m | ForEach-Object {$_.groups["num"].value}

$regex.GetGroupNames()

[regex]::Matches($string,'(?<word>[a-z]+) (?<num>[0-9]+)')

[regex]::Matches($string,'(?<word>[a-z]+) (?<num>[0-9]+)') | `
ForEach-Object {$_.groups['word'].value}

#endregion