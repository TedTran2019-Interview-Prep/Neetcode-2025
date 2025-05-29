```ruby
# array of integer nums, sliding window of size K
# very left to very right, can only see K numbers in window
# Sliding window moves right by 1 position
# Fixed size sliding window
# return maximum of each fixed size window
# 1 3 -1 3 5 3 6 7
# 3 3 5 5 6 7

# Brute force:
# - For every window of size 3, take the max. Move one forward, repeat.
# - How do I reduce duplicate work?

# What happens when a number goes forward? Options:
# - Maximum is kept, run into a higher/equal maximum (Take higher max)
# - Maximum isn't kept, run into a higher maximum (Same as higher maximum)
# - Maximum is kept, don't run into a higher number (Keep max)
# - Maximum isn't kept, don't run into a higher maximum (Need to know what's highest in window now?)
# - At any given time, we know the maximum and how long it'll last for
# - We'll know the index of the maximum + the size of the window
# - Anything before maximum doesn't need to be regarded
# - We only need to regard maximum index + k - 1 for next maximum? (Not counting new right index that's less than maximum)
# 9 8 7 6 5
# [9 8 7]
# 9 7 8 6 5
# [9 7 8]
# Couldn't figure it out!

# Neetcode solution: utilize a montonic decreasing dequeue
# Leftmost value always holds the highest value in window
# - It can only "fall out" when window moves past it
# - Or be replaced by a greater/equal (aka more recent) maximum (all values replaced)
# - Otherwise, when a value found less than max
# - Check if that value is greater than elements at back of queue, if they are, pop them off until new element is in proper place (this greater element makes all elements in between max - through this element irrelevant)
# Size of queue is guaranteed to be less than or equal to window because we always remove at least 1 element as the window moves forward
# Syntax docs: https://www.rubydoc.info/github/kanwei/algorithms/Containers/RubyDeque

# Plan:
# create dequeue
# left = 0
# maxes = []
# iterate through nums, do num, right
#     pop from front of queue when window pasts it
#     # How can you tell when window pasts the num? Indexes!

#     is num >= to back of queue?
#         # (this handles case where num >= max too)
#         pop from back of queue
#     add num to queue

#     if right >= k - 1
#         add front of dequeue to results
# maxes
```
