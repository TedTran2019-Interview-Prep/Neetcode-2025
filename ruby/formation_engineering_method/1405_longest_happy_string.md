```ruby
=begin
string s is called happy if:
only contains abc
does not contain 'aaa', 'bbb', 'ccc' as substring
s contains at most a occurrences of a
... so on for b, c
substring = contiguous sequence of characters within a string
longest possible happy string

naive: check if every partition is a happy string
won't work, have to build...

Isn't this just a sliding window problem?
Have a hashmap counting # of chars
Keep track of length + longest possible happy string so far
If at any point the window becomes 'aaa', 'bbb', 'ccc' aka invalid start moving from the back
Basically on any invalid condition move forward. On non-abc you can just empty and move forward

Wait, I misunderstood the problem: you have to CREATE the string, you aren't given a string
This is similar to reorganize string.
a = 7, b = 1, c = 0
aabaa

Don't overcomplicate the problem
At any given point, choose the greatest one that's VALID
That's it
(Keep it to one character at a time)
=end
```
