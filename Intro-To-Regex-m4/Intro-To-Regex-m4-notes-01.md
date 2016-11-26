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

As the name of the module eludes to, shorthand characters are used to shorten expressions by having a single metacharacter represent several metacharacters

shorthand metacharacter characters shorten expressions by using a single metacharacter to represent several characters.they, can be used to represent a wide variety of things.

Such as all whitespace characters, which includes tabs, spaces, newlines etc.. Other shorthand metacharacters are used to represent digits. There is even a shorthand metacharacter to represent every possible character. In my opinion it’s a bit over used, but it does come in handy. On the next slide you’ll see a table that contains several of these shorthand characters.

Starting on line 5, I'm populating a variable called $matchAnything with several different character. this 
array will `contain the letter` a the number 1 an explimation mark and a space. 

On line 7 I'm running every item in that array against the shorthand metacharacter (period). The purpose
of showing you this is to demonstrate that the period will match any character. I'll use this shorthand
metacharacter more later in the course, but I wanted to introduce you to it now so you are somewhat familair
with it's meaning. 

The intent behind this expression was to find accounts that are prefix with three characters followed by 
and underscore. By the Definition, default account shouldn't be in the output. The reason it is, is the
name default account contains  words and has the word account in it, so it matched. To avoid having
this in the output I need to get more specific and say I'm looking for 4 word characters followed by the
word account. To accompish this I'd need to use something called an anchor, which you'll learn about in
an upcoming module.

On line 20 I'm using the get-netipaddres cmdlet to get the ip version 4 address from the ethernet adapter of
the server and storing it in a variable called $ipaddress.

to validate all the digits inside the ip address. I've sparated the octets in the ip address with a period
as you'd see in an ipaddress.

The next shorthand metacharacter I'll show you is the backslash s metacharacter. If you recall from the slides
it is used to represent any whitespace character. Lines 3 and 4 populate a variable called $text with a sentense
"This text contains whitespaces and a newline." I'll run these two lines to populate that variable.

 Now, on line 8 I'm attempting to use the split method to split on a space character. 
 What I'd expect to see when I run this is one word per line in the output. However, as you can 
 see from the output that's not the case. The reason for this is, not all whitespaces are created equal.
 a new line is different from a space and the split method can't handle more than one space at a time. 
 
 It's siturations like this that make it worth knowing regular expression, because without it, it would
 be rather difficult to get the desired result with just the split method. 

sadly, however we still have some blank lines between the word...., but why..

The reason this didn't work was becuase the expression was looking for a single space first. This is a problem
because everytime there were two spaces one was left over which is why you see a few blank lines in the
output.