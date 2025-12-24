```ruby
=begin
encoded string, return decoded
k = guaranteed positive
k[char]
Tricky part is that they can be nested
3[a2[c]]
3 * (a + (2 * c))
Means acc repeated 3 times
3[a]2[bc]
3 * a + 2 * bc
Basically find out result of inner equation and multiplify it by outer
Just do it using recursion...
What should each "layer" handle?

How about solving it using a stack?
Add everything to stack until ']'
Once ']', pop until '['
Pop while number
Number * what was inside of [], add back into stack
Repeat process
=end
```
