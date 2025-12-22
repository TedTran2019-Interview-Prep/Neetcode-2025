```ruby
=begin
Implement a stack using two queues
in context of queue, pop is shift (remove first element entered)
empty just checks both queues
how to do push and pop?
Putting from 1 queue to another just creates the same queue
Push: push to push queue
Pop/Peek: Push everything from push queue to pop queue except for last element
- Peek/pop last element!
- What if push queue is empty?
- Put everything from pop queue and put it into push queue, last element is popped/peeked
=end
```
