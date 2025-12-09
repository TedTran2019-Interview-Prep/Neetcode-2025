```ruby
=begin
calculate sum of elements of matrix inside rectangle defined by:
upper left corner, lower right corner
(row1, col1) : (row2, col2)
(1, 2) : (2, 4)
Take: (1,2), (1, 3), (1, 4)
Take: (2, 2), (2, 3), (2, 4)
From row to row, take col to col

sumRegion must work on O(1) time complexity
prefix sum on array
but how do you do prefix sum on a grid?
was thinking about prefix sums with offset.. but how to do it efficiently?
[3, 0, 1, 4, 2]
[3, 3, 4, 8, 10]
If you want 2-4, 10 - 3 = 7.
You take the prefix sums you want [4], subtract by ones you don't want start - 1.
O(1) time for any prefix sum.
Then just repeat that on any grid.
Do the calculation but row amount of times? -> No, not efficient enough

Prefix sum on a grid (Add not only the number before, but the number ABOVE too)
[3, 0, 1, 4, 2] => [3, 3, 4, 8, 10]
[5, 6, 3, 2, 1] => [5, 11, 14, 16, 17] => [8, 14, 18, 24, 27]
27 is the total sum of first two rows...
what if you wanted starting from 2nd col (0, 1) -> (1, 4)
27 - 8 = 19.
What if you wanted only 2nd row? (1, 0) -> (1, 4)
27 - 10 = 17.

Bottom right (sum of all prefixes)
- above that (start row - 1), aka unused
- left (all values unused in row and above)
+ top left aka above left (values double subtracted)

Make the prefix matrix +1 row, +1 col filled with 0s to not bother with nil checks
...
```
