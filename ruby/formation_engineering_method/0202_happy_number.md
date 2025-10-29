```ruby
=begin
Determine if number n is happy
Any positive integer (1+)
Replace number by the sum of the squares of its digits
Repeat the process until number equals 1 OR loops endlessly which doesn't include 1
Ends in 1 == happy (true) otherwise false

In a loop...
remainder 10 to get last digit, divide by 10 until it's 0 to get each digit
Do digit to second power, get the sum
Repeat on that digit until it's 1
What happens if it hits an endless loop condition?
2 = 2^2, 4 -> 2, repeat forever
How do we know that we're in an endless loop and break out?
Same number has been hit once before is hit again! == false
=end
```
