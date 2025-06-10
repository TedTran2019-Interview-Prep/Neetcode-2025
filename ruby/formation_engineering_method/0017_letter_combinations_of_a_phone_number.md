```ruby
=begin
Str digits 2-9 inclusive
Return all possible letter combinations that could be represented
Backtracking combination problem w/ many answers
Basically 2 maps to abc, 3 to def... and so on
Backtrack through the digits
If you see a 2, you can either put: a, b, or c
Then if you see a 3, you can either put: d, e, or f
With these two, you can have ad, ae, af, bd, be, bf, cd, ce, cf...
=end
```
