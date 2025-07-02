```ruby
=begin
Merge triplets to form target triplet
Triplet: array of 3 ints
Given: an array of triplets, target (a triplet) to obtain
Operations:
1. Choose two indices (i/j different) and update triplets[j] to take max of each value
return true if possible, else false

This is a very greedy problem as you can only MAX, and you'll max all 3 values simultaneously
1. You don't want to go over for any value, because you can't go back under
2. All you really want is the exact value every time
3. You can't use it if getting one of the 3 values makes another value go over

Go through triplets
Keep track of how many of the target a/b/c are satisfied
If there's a triplet that's under/equal in all 3, mark all values that are equal as satisfied
Do the same until you've gone through all triplets
That's it, O(N) babyyy
=end
```
