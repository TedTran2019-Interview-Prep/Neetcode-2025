```ruby
# Remove nth node from end of list then return head
# 1 2 3 4 5, n == 2
# Remove 4 -> return 1 2 3 5
# Keep track of prev value
# Do a "trailing" pointer that starts moving n after the fast
# Once trailing lands on value to be removed, use prev
# What if prev is nil (lands on head), or trailing never reaches any value?
# n is always between 1 and # of nodes in list confirmed
# Only have to deal with prev is nil aka changing heads

# Plan:
# Iterate through the LL, stop when n == 0
#     move fast pointer up
#     n -= 1
# prev = nil
# iterate through the LL, stop when fast pointer is nil
#     fast and slow pointer up
#     keep track of prev of slow

# depending on if prev is nil or not
#     delete that node

# return head
```
