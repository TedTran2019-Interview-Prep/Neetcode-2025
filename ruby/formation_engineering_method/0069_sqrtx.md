```ruby
=begin
non-neg x, return square root of x rounded down to nearest integer
returned negative must be non-negative
NO using built-in exponent function or operator
x = 4, 2
8 is 2.8, round down to 2

Another binary search problem.
0 to x
See if middle * middle == x, less than, or greater
Return when out of loop or when equal
2 * 2 = 4, less than x. Sets left to 3
3 * 3 = 9, greater than x. Sets right to 2.
=end
```
