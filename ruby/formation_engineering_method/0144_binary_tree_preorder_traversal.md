```ruby
=begin
process
left
right

Using iteration?
Use a stack and toss root in
[1] -> eval 1, then toss right value first then left (right is evaluated last)
[3 2] -> eval 2, toss in 5 4
[3 5 4] -> eval 4, toss in nothing
[3 5] -> eval 5, toss in 7/6
[3 7 6] -> eval 6, 7, 3, 8, 9
Using a stack to simulate recursive calls!
Plan:
stack = []
result = []
stack << root if root
until stack.empty?
    node = stack.pop
    result << node.val
    stack << node.right if node.right
    stack << node.left if node.left
result
=end
```
