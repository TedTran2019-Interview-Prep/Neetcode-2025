```ruby
=begin
s containing "(" ")" and "*"
return true if it's "valid"
It's valid when:
Any left paren has a right paren
Any paren paren has a left paren
Left paren must go before right paren
* can be treated as a left, right, or NOTHING

Greedy problem...
Realize that left can't ever be less than right at any given point
- That would mean a right came before corresponding left
To put it simply, keep track of min left + max left
- This would be REAL min left (can't be negative) + max left by the end
It's valid if there are 0 lefts remaining, does 0 fall between min left and max left?
If max is ever negative, return false (left b4 right)
=end
```
