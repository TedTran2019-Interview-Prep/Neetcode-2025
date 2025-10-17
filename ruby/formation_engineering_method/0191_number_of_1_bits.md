```ruby
=begin
Given positive integer n, write a function that returns # of set bits in binary
Naive:
Convert n to binary with to_s(2) then count the 1's

Possibly a better approach?
If number is say, 65
Try to find largest number that fits within 65 that's a multiple of two
Go from end, subtract 65 - 64, then try 32, 16, 8, 4, 2, 1, etc counting
the numbers that subtract

How do I do the above approach effectively?
Look at the constraints: It's within the size of an n^31
So you can go from 31 down to 1, checking if any of them are 1s
How do you check? n & 1 (1 and 1 == 1)

Even better approaches?
Think about it the other way: every time you divide by 2 or shift all bits to the right is same
Then you can (mod by 2) or (and by 1) to check if it's a 1

Best approach?
This is a trick (you probably won't come up with it):
n = n & (n - 1)
=end
```
