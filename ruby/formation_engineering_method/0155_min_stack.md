```ruby
# Design a stack that does: push pop, top, and retrieving the min in O(1)
# So for a regular stack: push, pop, and top are already O(1)
# But the issue is get min in O(1)?
# -2, 0, -3
# Maybe each element in the stack stores extra information?
# -2 [-2], 0[-2], -3[-3]...
# -5[-5], -2[-5], 0 [-5], -6 [-6].. stack stores the latest minimum

# Plan:
# initialize: stack is just an array
# push: push not only the val, but also the min of stack[-1] and val as a tuple
# - if nil, it's just the min itself
# pop: pop the value off the stack, returning the 0th index item of the tuple (or return nil if the stack is empty)
# get_min (looks at top of stack, then returns the 1st index item of the tuple) or nil if empty
```
