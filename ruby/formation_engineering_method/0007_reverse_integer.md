```ruby
=begin
Signed 32-bit integer X
Return it with digits reversed (if it goes beyond 32 bit integer range, return 0)
Naive:
If it's below -2^31 or beyond 2^31 - 1, 0
Convert to string, check if negative is first number, store rest. Check if less than limits to return 0 or not
after reversing.
However, this only works if can store 64-bit integers.

Better: (Works without 64-bit integers)
Get the sign of the number and convert to positive
Start reversing by:
Modulo 10 (get last digit)
Divide by 10
For the last digit, add to reversed number and multiply by places
Then all we need to check the size of the value before overflowing...
-2147483648 for negative
2147483647 for positive
E.g
We're given:
74638487412
2 -> 2
1 -> 21
...
4 -> 214748364
If number is greater than 214748364, return 0
If number is less than it, any number is fine
If number is equal to it, ensure number is less than or equal to 7

For negative, same process but...
If number is greater than -214748364, return 0
If number is less than it, any number is fine
If number is equal to it, ensure number is less than or equal to 8
=end
```
