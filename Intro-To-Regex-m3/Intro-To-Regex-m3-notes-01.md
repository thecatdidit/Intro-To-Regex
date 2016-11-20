To start off this demo I will be using alternations to match two word within the string
"learning regex is awesome!" Some might disagree with that statement, but hopefully you don't.
I remember when I started learning regular expression, every time I figured out something
I kinda felt like a wizard. anyway, back to the example on line 5.  

To match the two word within the string, I'm using the select-string cmdlet with the expression learning pipe
regex. The alternation is indicated by the pipe symbol. This allows me to match both of the words within a
single expression. I'm also using the -all parameter to find all the 
mathces then pipoing that to foreach-object and returning all the matches to the console with the matches
keyword. 


scrolling through the output you can see some set cmdlets which is what we expect. Reset showed up yet again
because set is inside reset. I'll show you how to fix this by using anchors in an upcoming module. Just above
reset is get another verb we expected to see and way at the top you can see the add verb cmdlets. 

the next example where I'll demonstrate using regular expression to find all files with a powershell
extension

if you're not familair with powershell extensions they can end in either a .ps1, .psm1 or .psd1 and that's
what this expression was designed to match.

###
In the last example, I will be using an alternation to search the windows event logs for created user
events and deleted user events where the message matches a few specific usernames. but before I can do
that I have to generate the logs. 

In the last example, I will be searching the windows event logs for created user events and deleted user
events. I will be using an alternation to look for two specific user names within the message of the event.
but before I can do that I have to generate the events first. 

starting on line 17 I'm clearing the security event logs, the only reason I'm doing this is to make my
query run faster. Clearning the logs prevents me from having to search a lot of logs which woud take a
good chunk of time. 

On line 19 I am populating a variable called $users with serveral new user names. Then on lines 21-24,
I'm using a foreach loop to go through each user in $users within the loop it creates the new user and the
deletes the user. 

Doing this will create 2 events per user a created user event and a deleted user event.

and then I'm piping that to where object. If you haven't seen where-object used like this before, this
is the synatx that allows you to define multuiple statements. Within the two curly brakes I have two
statemens one is lookig for message that is like mhall and the second is looking for message that is
like aleiws. I've placed a logical -or operator inbetween these two statements so it will find 
either of these two users within the message of the event. 

It's worth mentiong that most things you work with on windows are objects but in certain casses such as
this message it's just a string. and when you are dealing with a string it becomes harded to parse with
out knowing a little bit of regular expression. We'll take a look at paring this message with
regular expression again later in the course, but for now let's head over to the summary slide and
review what you've lenared about alternations.