```ruby
=begin
tokens that represent arithmetic expression in RPN
evaluate expression, return integer
division truncates towards 0
no zero division
assume proper RPN expression
[2, 1, +, 3, *]
push [1, 2] onto stack
see +, means pop 2, add them together (3), push back onto stack
[3, 3]
* = 9, aka last remaining element in stack
=end
```
