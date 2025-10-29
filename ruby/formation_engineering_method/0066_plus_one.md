```ruby
=begin
Given large integer represented as an int array digits
Each digits[i] is the ith digit of the integer
Most to least significant left to right
No leading 0s
Increment the larger integer by 1 and return the resulting array of digits
[1, 2, 3] -> [1, 2, 4]

Go backwards
remainder = 1 (we're adding one)
Add and calculate remainder...
If remainder is 1 by the end, shift a 1 in front of the array
=end
```
