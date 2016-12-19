#region subexpressions

#single subexpression

'123 456' -match '123\s(456)'

#double subexpression

'123 456' -match '(123)\s(456)'

#non-capturing subexpression

'123 456' -match '(?:\d+)\s(\d+)'

#repeating subexpressions

'123 456' | Select-String -Pattern '(\d+)+' -All | % Matches

#endregion