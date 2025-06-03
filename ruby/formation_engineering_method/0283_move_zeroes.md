```ruby
=begin
array of INTs: all zeroes to end of list
Maintain relative order of non-zero elements
IN PLACE without making a copy of array

[0 1 0 3 1]
[1 3 1 0 0]

[1 0 0 3 1]
[1 3 0 0 1]
1 3 1 0 0
0 is found -> swap upwards
What happens if [0 0]
From prev zero to first zero, swap!
aka move whatever value hit to beginning of first zero, move forward from second zero
If don't find 0? Done!
If next value is end of array? Done!

Plan:
find_zero = 0
move find_zero until first zero is found and in bounds
if find_zero > array.length return array
Once zero found, swap forward until end OR reaches another zero
If another zero reached
  - no need to swap, have some zero_counter and increase it
  - swap by current and curr index - zero counter
=end
```
