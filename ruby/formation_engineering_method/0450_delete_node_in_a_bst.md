```ruby
=begin
root node of BST, key
delete node with given key
1. search for node
2. if found, delete node
What happens if said node is deleted?
If node has no children, simply delete
If node has 1 child, that 1 child is the new link
If node has 2 children, right child is the new node, then left child...
has to be attached somewhere to the right child? Complicated because left child can be
its own entire tree of nodes... then you have to go through that entire detached tree and add the nodes to the BST.
Edge cases:
 - root is deleted
 Could probably make this simpler with some type of dummy node that points towards root, like dummy.left = root then just return dummy.left at the end. Deals with all root deletion cases!
 =end
```
