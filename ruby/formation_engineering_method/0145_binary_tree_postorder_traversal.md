```ruby
=begin
left
right
process

have a stack
for every iteration, pop what's in the stack
if second time visiting
    push val
ELSE
    push node back into stack (and set visited)
    push right value into stack
    push left value into stack

It's because you process the left values first that you push the rights first, like in preorder.
Adding on second visit is genius, clean clever NC solution
When all of a node's subtrees are visited, you can add that node too
=end
```
