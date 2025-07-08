```ruby
=begin
m*n matrix board
contains: 'X', 'O'
Connect: conencted to adjacent cells horiz/vertically
Region: Connect every '0' cell
Surround: Surrounded with 'X'
- Can't be surrounded if any region cells are on edge of board

Inverse thinking (Seems common in graph problems!)
Capture all surrounded regions...
- Find all non-surrounded regions and mark
- Make everything else into X's
- Turn marks back into 0's
=end
```
