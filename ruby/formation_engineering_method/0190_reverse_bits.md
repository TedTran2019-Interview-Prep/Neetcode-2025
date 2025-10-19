```ruby
=begin
Reverse bits of a 32 bit signed integer...
Naive: to_s(2).reverse (Would this be allowed?)

Doing it properly:
Set the number of result to 0
Start from left of new number, right of old number
Set the bit at left to be right's value
But how do I get to specific bits? -> shift left and right baby!
=end
```
