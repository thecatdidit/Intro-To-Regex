#region capture_unc_servername

'\\server\share\folder\powershell.ps1' -match '^\\\\([-a-z0-9_]+)\\.*'

#endregion

#region extracting_ActiveDirectory_data

#capture user name and replace string with capture

'CN=Administrator,CN=Users,DC=globomantics,DC=com' -replace 'CN=(\w+).*','$1'

#convert DistinguishedName to domain name

$DistinguishedName = (Get-ADUser -Identity ssmith).DistinguishedName

(($DistinguishedName -replace "(.*?)DC=(.*)",'$2') -replace "DC=","") -replace ",","."

$DistinguishedName -replace "(?:.*)?DC=(.*),DC=(com|net)",'$1.$2'

#endregion

#region finding_event_sources
cmd /c wecutil gs appevents

#non-regular expression approach
(cmd /c wecutil gs appevents | `
Select-String -SimpleMatch "Address" ).ToString().Split(':')[1].Trim()

#removing domain name with split
(cmd /c wecutil gs appevents | `
Select-String -SimpleMatch "Address" ).ToString().Split(':')[1].Trim().Split('.')[0]

#regular expression approach
(cmd /c wecutil gs appevents | Select-String -SimpleMatch "address:").ToString() `
-replace '\sAddress:\s+(\w+)','$1'

#removing domain name with regex
(cmd /c wecutil gs appevents | Select-String -SimpleMatch "address:").ToString() `
-replace '\sAddress:\s+(\w+)(?:.*)','$1'

#endregion