```ruby
=begin
n steps to reach top of staircase
can only take 1 or 2 steps
How many ways can you climb to the top?

Naive recursive approach: (decision tree)
take 1 step
take 2 steps

Memoized approach:
Keep track of how many potential solutions at a step
Add that number instead of calling when possible

Bottom-up approach:
At 0 steps, there are 0 ways...
At 1 step, there's only 1 way...
At 2 steps, there are 2 ways...
At 3 steps, there are 1 + 2 ways...
At 4 steps, there are (3 step ways + 2 step ways)...
=end
```
