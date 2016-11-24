####shorthand characters pg 49 Mastering regular expression.
* \t tab character
* \n newline character
* \r carriage-return character
* \s matches any "whitespace" (space, tab, newline, etc...)
* \S non-whitespace characters
* \w [a-zA-Z0-9_] any word character
* \W [^a-zA-Z0-9_] any non-word character
* \d [0-9] digit characters
* \D [^0-9] any non-digit characters
* . match any character

Metacharacter | Definition
--- | --- |
\t | tab character
\n | newline character
\r | carriage-return character
\s | matches any "whitespace" (space, tab, newline, formfeed, etc...)
\S | non-whitespace characters
\w | [a-zA-Z0-9_] any word character
\W | [^a-zA-Z0-9_] any non-word character
\d | [0-9] digit characters
\D | [^0-9] non-digit characters
. | match any character

#ideas
1. trim white spaces \s
2. match newline

'   ' -match '\t'

'
' -match '\n'
$tab = '1      2'
[regex]$rx = '(\S)+'
$rx.matches($tab)

