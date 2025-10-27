```ruby
=begin
nxn 2D matrix representing an image
rotate it 90 degrees clockwise
rotate IN PLACE, do not allocate another 2D matrix

naive:
allocate another
In a 3x3 matrix (y, x)
[0][0] -> [0][2]
[0][1] -> [1][2]
[0][2] -> [2][2]
[1][0] -> [0][1]
[1][1] -> [1][1]
[1][2] -> [2][1]
[2][0] -> [0][0]
[2][1] -> [1][0]
[2][2] -> [2][0]
[y, x] -> [new y is simply going from 0-final matrix index (matches old x)][new x is final matrix index - original y]

math wizardry:
transpose then reverse
How to transpose?
123
456
789
->
147
258
369
[0][0] -> [0][0]
[0][1] -> [1][0]
[0][2] -> [2][0]
[1][0] -> [0][1]
[1][1] -> [1][1]
... and so on.
Just need to swap, going in deeper and deeper so you don't repeat swaps
123/147 -> 56/58 -> 9
=end
```
