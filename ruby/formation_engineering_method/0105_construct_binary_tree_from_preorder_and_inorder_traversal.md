```ruby
=begin
From preorder:
Do stuff
Left
Right
[3 9 20 15 7]

From inorder:
Left
Do stuff
Right
[9 3 15 20 7]
Guarantees left first then right

For preorder, first value is always the root
If 3 in preorder, find in inorder
All values to the left of 3 in inorder consists of left subtree in the original tree
Use both preorder/inorder arrays to get the binary tree...

If either preorder or inorder is empty, just return (Base Case)
Create root from first node in preorder
middle is where that root is
left tree of that root consists of:
- preorder options are 1 up to mid index
    - notice how order of values in inorder relate to preorder
    - e.g, all values to the left of said node belong to left subtree
- inorder is 0 up until mid index (not including since it was used to create root)
    - aka all values to the left of that number
right tree of that root consists of:
- preorder is mid + 1 up til' last
    - notice how order of values in inorder relate to preorder
- inorder is mid + 1 up to end
    - aka all values to the right of that number
=end
```
