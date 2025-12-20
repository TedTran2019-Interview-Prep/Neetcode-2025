```ruby
=begin
Sorted in non-decreasing
Remove duplicates in place (relative order kept same)
How do I move all duplicates to end of array?

[1, 1, 2]
k = 1 (nbr of unique elements and index where it goes)
Is this nbr unique? (Is NOT equal to the number before it)
- If it's not unique, move on
- If it is unique, place it into k's index
- Increment k
Return k at end

Rather than thinking about placing duplicates at end...
Think about placing non-duplicates in order at the front
=end
```
