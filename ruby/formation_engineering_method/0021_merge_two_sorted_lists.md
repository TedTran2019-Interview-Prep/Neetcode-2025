```ruby
# Two sorted linked list L1 and L2
# Basically the merge function of a merge sort
# 1 2 4
# 1 3 4
# merged = takes L2
# L2 pointer moves forward to 3
# merged takes in L1, L1
# merged takes in L2 L2
# Then merged takes in whatever's left of what's not empty

# Plan:
# merged = Dummy node
# current = merged
# while l1 && l2
#     if l1's value < l2 value
#         current.next = l1
#         l1 = l1.next
#     else
#         current.next = l2
#         l2 = l2.next
#     current = current.next
# current.next = l1 if l1
# current.next = l2 if l2

# return merged.next at the end
```
