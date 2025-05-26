```ruby
# Two non-empty LL representing two non-negative integers
# Digits stored in reverse order, each node contains a single digit
# Add two numbers and return sum as a LL
# No leading zero besides zero itself
# Why stored in reverse order?
# - Think about carrying, can carry -> to next node
# If it weren't in reverse, it's way more of a pain
# Keep track of carry
# Add carry + node1 + node2 (or whatever node that's remaining)
# When creating/adding to LL, do head = prev node so you don't need to manually reverse at the end

# Mistake: Nvm, we don't have to reverse, so plan is wrong.
# Plan:
# carry = 0
# new list = nil
# while l1 || l2
#     l1 val = l1&.val || 0
#     l2val = l2&.val || 0
#     value = l1 + l2 + carry
#     carry = value / 10
#     value = value % 10

#     new_node = value
#     new_node.next = new list
#     new_list = new_node

#     l1 = l1.next if l1
#     l2 = l2.next if l2

# if carry > 0
#     make carry the head
#     carry.next is rest of the created new LL

# return the new LL
```
