- Tricky O(1) space solution involving multiple LL techniques
  - Fast/slow pointers to find the middle
    - Trick on fast/slow to stop one before middle
  - Reversing a LL
  - Merging two linked lists

```ruby
# Given: head of singly linked list
# Cannot change nodes
# 1 2 3 4
# 1 4 2 3
# How would you do this in O(1) space?
# Find the middle of the LL
# 12 / 34
# Reverse the second half
# 12 / 43
# Merge one from left, one from right, one from left, one from right...
# 1 4 2 3

# 1 2 3 4 5
# 123 / 45
# 123 / 54
# 1 5 2 4 3
# Works for both odd/even cases

# Plan:
# Use fast/slow pointers to get to to the middle of the linked list
# From the slow pointers onwards, reverse the second half of the LL
# - 1 -> 2 -> 3 -> 4, do I need to cut off connection between 2 -> 3?
# Iterate from start of first half to end, adding nodes. What happens if one half ends first? Add whatever is remaining to the list like in a merge

# How do a reverse again?
# 1 2 3 4
# current = 1
# 2.next = 1
# 3.next = 2
# 4.next = 3
# Keep keep of prev node and next_node (so not overwritten), then just return last node
```

- For O(N) space solutions

```ruby
# Given head of a singly LL
# NOT allowed to modify values, can only change the node themselves
# Given: 0 1 2 .... n-1, n
# Should become: 0 n 1 n-1
# Basically taking first node + last node, second node + second to last node... and so on.
# 1 2 3 4
# 1 4 2 3

# 1 2 3 4 5
# 1 5 2 4 3
# Simple approach:
# Take a pass to put all nodes into an array
# Use a two pointer approach to link 1 -> 4, 2 -> 3
# The previous end node used should be kept, because it should point at the new first node (4 -> 2)
# And the second node should be made to point at nothing (4 -> nil, 3 -> nil)

# But is there a way to do this without using O(N) space and an additional pass?
# I can't think of anything right now, so I'll just implement the two pointer with array approach.

# Plan:
# Put all nodes into an array
# current = dummy
# use two pointers to traverse through array
#     current.next = left
#     right.next = nil
#     left.next = right
#     current = right
# return head

# What happens in case of odd numbered lists?
```
