```ruby
=begin
n tasks labeled from 0 to n - 1
2D array tasks, tasks[i] = [enqueue time, processing time]
ith task will be availableto process at enqueue time and will take processing time
single threaded CPU that can process 1 task at a time
idle: remain idle
idle and available, choose shortest processing time, choose smallest index if competition
once task started, process entire task without stopping
can finish then start new one instantly

issue: choosing task with smallest index...
modify tasks to be enqueue time, processing time, index then sort by enqueue time
start time at 0
add all smallest times to heap, comparison will be processing time first, index as tiebreaker
pop smallest value from heap, add to time
repeat

I shifted values out of the tasks array since shift is O(1) in Ruby, but if using another
language a person can also use indexes, or sort in reverse order then pop. (Then you'd look at
tasks[-1] instead of tasks[0]), not a big difference.
=end
```
