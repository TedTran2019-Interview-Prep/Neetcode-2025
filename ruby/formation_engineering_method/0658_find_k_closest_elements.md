```ruby
=begin
sorted arr, k/x
return k closest integers to x in array
result should be sorted in ascending order
closer = |val - x| is less OR lesser index

[1, 2, 3, 4, 5], x = 3
L            R
If 1 counts as closer due to lower index
[1, 2, 3, 4], x = 3. Since length of window is 4, stop.
That's it!
=end
```
