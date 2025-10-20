```ruby
=begin
0110 & 0111 = 0110 (carries)
0110 ^ 0111 = 0001 (new a value)
0110 << 1 = 1100 (new b value)

0001 & 1100 = 0000 (carries)
0001 ^ 1100 = 1101 (new a value, answer)
0000 << 1 = 0000 (new b value)

XOR correctly handles the addition without carryover
AND handles carryovers, but how do we add that properly? (Carry over goes to NEXT bit)
Essentially add A + B, B becomes the carryover when shifted one bit, repeat

To handle for Ruby: add a mask and convert back to two's complement...
=end
```

```ruby
=begin
Add (a + b), sum of two integers without using + or -
0001 + 0010 = 0011
0010 + 0011 = 0101
What has to be handled?
If two 1's (one's place is carried over, set to 0)
If one 1 (put a 1 there)
If two zeroes (keep zero)
What about carryover in each case?
-> 0 becomes 1
-> 1 becomes 2 (0, 1 carryover)
-> 2 becomes 3 (1, 1 carryover)
0010
0011
Isolate each bit, XOR to get original value
Use AND to get carryover

How do I handle the carryover addition without using +?
0011 + 0011 = 0110
Start by "adding" the carryover to the first value
XOR carryover, first value = new first value  (1 1) = 0
AND carryover, first value = new carryover (1 1) = 1
THen repeat
XOR new first value,second value = added value (0 1) = 1
AND new first value, second value = remaining carryover (0 1) = 0
    THIS should only happen if carryover is zero

Maybe less confusing would have been to do different logic sets for (if no carryover) and (if carryover), but whatever.

Now how to isolate all the relevant bits?
Isolating rightmost bit to leftmost in original two values:
    number & (1 << (bit place))
How to isolate(set) summed number (starting at 0)
    sum |= (1 << bit place) IF the new value is NOT 0

carryover = 0
sum = 0
Let's go from 0 to 31
    a_bit = number & (1 << bit place)
    b_bit = number & (1 << bit place)
    new_a_bit = a_bit ^ carryover
    carryover = a_bit & carryover
    summed_bit = new_a_bit ^ b_bit
    carryover = new_a_bit & b_bit if carryover.zero?
    unless summed bit is zero
        sum |= (1 << bit place)
return sum

Why did it fail on case 11
0010100
0011110
0110010 = 50
0101010 = 42 (Is what I'm getting, looks like it's not handling double carryovers properly)
Oh, was resetting the carryover on the second case. SHould only calculate new carryover if it's 0

Whoops, my logic was setting the MASK, not the bit. Need to revise that...
(a >> bit_idx) & 1 gets the bit itself
a & (1 << bit_idx) gets the mask

Issue: this code doesn't handle negatives, let' start over and come up with something else...
=end
```
