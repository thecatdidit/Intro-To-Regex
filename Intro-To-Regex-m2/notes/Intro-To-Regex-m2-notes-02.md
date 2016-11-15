Character Class Ranges clip 3

I ended the previous demo by using regualr expression to validate an IP address. 
While that was somewhat useful wouldn't it be even more useful to validate that the ip address 
is within a valid range? Well, that's excatly what I'll do in this next example. 

Starting on line 7, I'm populating a variable called $IPaddresses with a bunch of different ips.
Then on line 9 I'm passing each of them to the match operator and validating them agains the expression
192.168.20.[123456]. This expression will only match if the ip is a valid host ip address for the network
192.168.20.0/29. 

If you're not familair with networking, just know that the only valid ip addresses for this range are
192.168.20.1 through 192.168.20.6. Anything outside that range doesn't belong to that network. I'll go ahead
and run these two lines now and you'll see which IP address are valid for this range.

[RUN CODE]

as it turns out only 192.168.20.1 and 192.168.20.3 are valid, the rest didn't match the expression and
are outside the range of valid host ip addresses. You might be wondering is there a better way to express
all these numbers? and if your thinking there is an easy better way your correct! 

Moving on to the next example, I'm doing the same thing as before validating the IP addresses for the network
192.168.20.0/29, but this time I'm using a range within the Character class. I've replaced the 123456 inside
the Character class with 1-6 which accomplishes the same thing, but is easier to write and read. 


