```ruby
=begin
array target, integer n
empty stack:
push: push int onto top of stack
pop: remove int on top of stack
stream of integers in range [1, n]
use two stack operations to make #s in stack equal to target
rules:
1. if stream of integers is not empty, pick next from top of stream and push to top of stack
2. if stack is not empty, pop the integer at top of stack
3. if at any moment, elements in stack from bottom to top are equal to target, do not read new integers or do more operations
return stack operations needed to build target following the rules

What would be the ideal? Given [1, 2, 3, 4, 5] and 1 is bottom and 5 is top...
Push elements onto stack while it matches target at proper position
If doesn't match, pop it
Repeat until stack matches target
Stream is from 1..n
=end
```
