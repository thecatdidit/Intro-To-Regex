Metacharacter | Minimum Required | Maximum to Try | Meaning
--- | --- | --- | ---
? | none | 1 |one allowed, none required
\* | none | no limit | unlimited none required
\+ | none | no limit | one or more
{%Maximum%} | |
{min,max} | |

### Demo

The very first quantifier I'll demonstrate is the astrisk commonly referred to as a star
in regular expression. On line three I have a string that contains the word expression with an
exclimation mark at the end, to match that string I have an expression that repeats the period
Metacharacter 11 times. The period is a Metacharacter that will match anything including the
special character at the end. When I run this I of course get a match and when I take a look inside the
$matches variable you can see it matched all 11 characters in the string.

taking a closer look at the expression used on line 30, I'm using the backslash w Metacharacter then the + sign 
quantifier followed by the word account. What the slash w is doing is matching any word character one or more times
that is why both default account and svc_account was found, remember the underscore is considered a word character

My intent with this expression was to find only service accounts and if I wanted to do that I need to make
my expression more specific and that is what I'm doing on line 32.

In this expression I used two different types of quantifiers one was used to specicy the exact amount of matches
and the other was used to match one or more instances. There isn't a limit  to how many quantifiers you can
use in an expression. I'll now move on to the last example in this demo which takes a look at validating phone
numbers and extentions. 

Throughout this module you learned about quantifiers. You learned that they are used to repeat characters
character classees and even subexpressions. The first quantifier you were introduced to was the astrisk or
start quantifier which is used to match zero or more instances. You then learned about the plus sign quantifier
that is used to match one or more instances after that you learned to make matches optoinal with the question
mark quantifier and the last quantifier discussed in this module allowed you to specify Minimum and Maximum
number of matches allowed.

After learning about all the different quantifier, I then demonstrated using sevearl quantifier to discover 
active directory service accounts as well as how to validate phone numbers.