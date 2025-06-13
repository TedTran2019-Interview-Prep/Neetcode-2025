```ruby
=begin
tasks (a-z)
number n
CPU interval: idle or completion of 1 task
tasks completed in any order
has to be a gap of at least N intervals between two tasks of same label
minimum # of cpu intervals to complete all tasks
If it were A-A with n = 2
A-idle-idle-A
At any given point:
- See if you can complete a task instead of idling
[A A A B B B]
A B IDLE IDLE A B IDLE IDLE A B
Have a count of every task's letter
Use whatever has the most + available
Swap between tasks N times
resort to idle if no options
max heap + queue

count number of tasks
create max heap using counts
keep track of time
have a queue (tracks count, time until available again)
until heap and queue is empty
    add to time
    pop from max heap if not empty
    take ele out of heap
        if ele is NOT 0 after subtract, add to queue
    if first element in queue is ready (minimum time)
        add back to heap
return total time
=end
```
