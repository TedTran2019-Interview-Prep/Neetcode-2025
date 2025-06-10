```ruby
=begin
nums that contains duplicates
all possible subsets
NO duplicate subsets
combinations problem...

How does one get rid of duplicate subsets?

This problem is pretty much same as combination sum ii and very similar to
three sum. The idea of sorting + skipping duplicates (if it's not the first element),
so that you skip over duplicate elements on the same recursive depth.
E.g, with [1, 2, 2]
You have a path that takes a 1, and one that doesn't take a 1
You have a path that takes a 2, and one that doesn't take any more 2's
You have another path that takes a 2, and one that doesn't take a 2.
Think about how if at one point in the recursion, you grab [1, 2]. At another point
if you didn't skip over the second 2, you'd get [1, 2] again. You're skipping duplicates
EXCLUSIVELY on the same recursive depth.
=end
```
