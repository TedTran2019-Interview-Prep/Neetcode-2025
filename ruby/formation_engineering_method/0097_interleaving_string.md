```ruby
=begin
s1, s2, s3: find out whether s3 is formed by interleaving of s1 and s2
interleaving: s/t are divided into n/m substrings

At each decision point:
- You can either choose to pick from string A or string B
- Once a string is out of characters, you have take all remaining chars from other string

Naive: try out every single combination by picking A/B

Better: Realize that order has to be kept
You only need to go in the direction when there's a match
It's true if you manage to reach the end of s3 using all of s1/s2

DP bottom-up:
Win-con is out of bounds for both s1/s2 (true at bottom right corner of graph)
At each point in the DP graph, you're either choosing A or B
If you pick A (x-axis), you have to go right (can't pick it again)
If you pick B (y-axis) , you have to go down (can't pick it again)
At each intersection point, add A + B indexes together to see if either matches s3
Then determine the value at that point through right + down values
Return DP[0][0] and done!
tl;dr for DP: find "win-con" and how to travel
=end
```
