O(1) Space Solution with interleaving trick

```ruby
# O(1) space solution using interleaving example
# Interleave original nodes with their copy
# A -> A' -> B -> B' -> C -> C'
# Go through, assigning random.
# This works because you can go to the random node then its next is the real node
# Separate original and copied nodes

# Plan:
# current = head
# # Interleave nodes
# while current
#     new_node = copy of current
#     placeholder = current.next
#     current.next = new_node
#     new_node.next = placeholder
#     current = placeholder

# # Replace real node orig random's with their real variant
# current = head.next
# while current&.next
#     if current.random, set current.random to current.random.next
#     current = current.next.next

# # Split nodes
# current = head.next
# while current&.next
#     current.next = current.next.next
#     current = current.next
# head.next
```

O(N) space solution

```ruby
# LL length n, each node contains an additional random pointer
# - Random pointer goes to any node in list or null
# Construct a deep copy of the list (exactly n brand new nodes)
# Each node has same value and both next/random of new nodes should point to NEW nodes
# NO POINTERS IN NEW SHOULD POINT TO ORIGINAL LIST
# Return head of copied LL
# Given: head of original LL

# Go through the LL once, creating new nodes and putting them into a hashmap
# Hashmap would be old node: new node
# Go through the LL again, this time setting the randoms
# (N) space and (N) time
```
