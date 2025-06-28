```ruby
=begin
nums, positioned at array's first index
each element in array represents maximum jump length at that position
true if can reach last index, or false otherwise
So basically, you can jump from a number (or any amount less)
You want to jump to the final number (array.length - 1 position)
I guess an easy way to do this:
Start with 2: With 2, you have options: 3, 1.
Since you hit 3 first, it's 3 + 1. You hit 1 second, it's 1 + 2.
3 + 1 == 4, 1 + 2 == 3.
The first choice can always reach any choice within 4 positions
The second choice can reach any choice within 3 positions
So you don't actually need to try both, because choosing the 4 available positions is always better.
So at 2, you're at position 0 with 2 jumps
Within those 2 jumps, 1 jump forward is a 3. So you choose position 1 with 3 jumps.
The position 2 with 1 jump only gets you to position 3 tops, as opposed to position 4 with the previous option.
That hits 4, so you win!
Basically you just need to know:
when to return false (when position can't be reached)
max reach potential as you iterate
if you can traverse entire array, true!

An even easier solution thinking about the problems backwards (inversion principle?)...
If you need to reach 4: can you reach it from the previous number? Yes, then
that number is the new goal. Otherwise, go to next number.
Then check if the first number can reach the goal post at the very end
The goal post is just an IDX
=end
```
