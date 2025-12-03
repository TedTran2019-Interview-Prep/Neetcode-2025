```ruby
=begin
points, [x, y] = ith point
choose 4 distinct points from points to form horizontal trapezoid
top/bottom are parallel to x-axis
in a parallel line, must share same y-axis
count number of points on a y-axis
count number of points on another y-axis
Hypothetical:
4 y-axis
A: has 1 (invalid)
B: has 2
C: has 3
D: has 4
2 points: 1 possible combination
3 points: has 3 diff combinations
4 points: 6 diff combinations
how many times to pick 2 unique points among xyz points on an axis?
Combinations formula:
n! / (k! (n - k)!)

Better formulas:
if you want to pick 2 items out of a group of items
ordered pairs: n(n - 1). You have n items, pick 2 distinct items in order, then you have n - 1 options after
unordered pairs: (A, B) and (B, A) are the same, so you divide by 2.

Instead of dual loop:
maintain a running sum of previous values
multiply current value by sum of all earlier values

So much math...
Unordered = combinations
Ordered = permutations
=end
```
