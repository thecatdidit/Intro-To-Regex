I'll start this first demo off by walking through the set reset example I talked about in the slides. To
simplify it I just have to two words set and reset specified as a string and I'll run them against the expression
set. 

When I run line 5 you can see the probelm I was talking about, this expression match both set and reset. There isn't
anyting wrong with this expression, it's doing what I told it to do which is look for an s followed by an e then a t.
The real problem is I wasn't specific enough what I really want the expression to do is match s e t only if it's at the
begining of the line and to do that I can use a start of line anchor to match that postion as you see on line 9. 

The anchor is represented by the carrot symbol, it's important to know that regular expression has a few different meanings
for chracters. in a previous module I used the carrot symbol to declare a negated character class, but because this
carrot is outside square brackets it's meaning is different.

In the next example, I'm using a start of line anchor in conjuction with the backslash w shorthand meatacharcers. slash
w is used to represent word character. When I ran this in a previous module, I didn't get exactly what I was looking for.
If I copy this line and remove the anchor you'll see what I mean.

The fix to this is to use an anchor an say there should be four word character between

and within the foreach loop each ID will be processed by the switch statement. This switch statement is using
regular expression pretty awesome isn't it? The ID passed to the switch is tried against three different expressions
the first one uses an end of line anchor to match the number 65 at the end of the number. If that's a match the variable
$messagedata equals "end of line match found and the ID variable" 

The next expression it attempts to match is ^65 which is a start of line anchor looking for numbers starting with 65. If
that is a match the $messagedata variable equals start of line match found and the id variable. 

The last expression uses both a start of line and end of line anchor to match the number 65. When that matches the
$messagedata variable equals start of line and end of line match found plus the variable $id.