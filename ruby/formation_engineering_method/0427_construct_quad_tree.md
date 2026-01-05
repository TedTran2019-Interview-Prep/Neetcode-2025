```ruby
=begin
n*n matrix of 0s, 1s
represent grid w/ quad tree
val is true if grids is 1s, otherwise false
val
isLeaf
4 quadrants
If current grid is all same value (all 0/1s) set isLeaf to true, all children to null, stop
If not, set val to any value and divide grid into 4 subgrids
Recurse into subgrid
Uhh, the explanation is kind of the solved problem?
We start out with grid y, grid x. Which are the lengths... get indexes, then go up til' that index.
Let's do 0...half, half...length
Then if if we need to split, we pass in a different set of start/end
0..y, 0..x
To split into 4
Len 10: 0...5, 5...10
Len 9: 0...4, 4...9

What was I doing wrong?
It's supposed to be start + end / 2...
Otherwise the math is all off on inner loops!
=end
```
