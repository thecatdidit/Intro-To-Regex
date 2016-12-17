#capture and replace
#repeat with a quantifier
#multipule captures show $0,$1,$2
#non-capturing group
'CN=Administrator,CN=Users,DC=wef,DC=com' -replace 'CN=(\w+).*','$1'