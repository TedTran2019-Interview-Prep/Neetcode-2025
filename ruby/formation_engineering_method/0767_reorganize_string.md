```ruby
=begin
given string s, rearrange s so any 2 adjacent chars are not the same
return any possible rearrangement of s or return "" if not possible

Naive:
create all possible permutations
Check if any are valid
This is not going to work..

aaab
abaa is the best possible result
After placing down 1 character (hopefully the most numerous), you want to place down the next most numerous
aaabbc (3a, 2b, 1c)
ababac
Constant placement of the most numerous character that's NOT the char just placed
Count #s of every character
have a max heap and add them all in
start creating str
pop from heap, add to str, subtract.
ensure it isn't the previous value u added (can hold this and add it back in)

Redo it with a previous variable and using heapify too to make it a lil' more efficient
=end
```
