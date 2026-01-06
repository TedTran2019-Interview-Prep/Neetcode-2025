```ruby
=begin
inorder traversal
left
process
right

How would I do this utilizing a stack iteratively?
Travel all the way left
Process node
Travel right if possible
Repeat

Look at node-- can I go left?
If can go left, push curr node onto stack
If can't, process node and pop until there's a node with a right
Process that node and add right node to stack

Iteration NC way seems a lot cleaner, let's try coding that up
Basically breaks problem into smaller parts, aka processing "1 node" at a time in a way
=end
```
