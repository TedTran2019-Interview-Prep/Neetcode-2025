```ruby
=begin
start at index 0
at index is max length jump from index
minimum # jumps to reach final index
greedy: if you can go further (jumps + pos), no need to consider previous

2 3 1 1 4
Can pick 3 or 1
Pick 3 because it reaches further (the last)
2 -> 3 is one jump, 3 -> 4 is another jump. Minimum is two.

Look at all available options within band
l (left of band)
r (right of band)
iterate until r is at last index
Whenever you calculate L/R, move:
L = right + 1, right = to whatever goes farthest within the band
=end
```
