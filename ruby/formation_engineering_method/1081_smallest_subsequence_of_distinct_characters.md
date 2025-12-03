```ruby
=begin
given string s, remove duplicate letters
find smallest subsequence of distinct characters

run thru string to find last occurrence of each character
create stack
next if stack already has character
pop all elements from stack that's lexicographically greater than current char + show up in the future
add current char to stack
=end
```
