#region word_boundaries

#Start of line anchor

'cat scatty scatter' | Select-String -Pattern '^cat' -all | % matches | % value

#End of line anchor

'scatty scatter cat' | Select-String -Pattern 'cat$' -all | % matches | % value

#Word Boundary

'scatty cat scatter' | Select-String -Pattern '\bcat\b' -all | % matches | % value

'cat scatty cat scatter cat' | Select-String -Pattern '\bcat\b' -all | % matches | % value

#endregion

#region Searching_permissions

#Setup sales directories
New-SalesShare -Path 'C:\'

tree

#Wildcards match to many groups

Get-ChildItem -Recurse | Get-Acl | `
select PSPath -ExpandProperty access | `
where IdentityReference -like '*sales*' | `
select IdentityReference,@{n='Path';e={($PSItem.PSPath -replace '\w+\.\w+\.\w+\\(\w+)::')}}

#Using a word boundary to filter results

Get-ChildItem -Recurse | Get-Acl | `
select PSPath -ExpandProperty access | `
where IdentityReference -match '\bsales\b' | `
select IdentityReference,@{n='Path';e={($PSItem.PSPath -replace '\w+\.\w+\.\w+\\(\w+)::')}}

#endregion

#region finding_server_names
$xml = Get-Content C:\Intro-To-Regex

$xml | Select-String -Pattern 'Customers' -AllMatches | % matches

$xml | Select-String -Pattern '\bCustomers\b' -AllMatches | % matches


#endregion