```ruby
=begin
temps, return answer such that answers[i] is # of days you have to wait for warmer temp
answer[i] = 0 if no warmer days
[73 74 75 71 69 72 76 73]: need a strictly decreasing monotonic stack
[73] -> see 74, pop 73 with 1 - 0, add 74
[74] -> see 75, pop 74 with 2 - 1, add 75
[75 71 69] -> see 72, pop 69/71 with their respective numbers and add 72... and so on.
=end
```
