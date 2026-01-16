```ruby
=begin
nums, integer k
true if possible to divide array into k non-empty subsets that are all equal

make an array of size k
add numbers to em' (doesn't matter which)
on the rest of the array, try all possible combinations of numbers
[4, 3, 2, 3, 5, 2, 1]
[5, 4, 3, 3] -> [2, 2, 1]
Try every combination of adding [2, 2, 1] to [5, 4, 3, 3]
optimizations:
- prune symmetrical (if doing all that to one 3 didn't work, no point doing it to another 3 on the same layer)
- sum and divide by k, ensure it's reachable
- sort in reverse order to get rid of branches early

My mistake: putting biggest numbers into buckets is a bad idea
This greedy logic can actually be wrong (e.g, what if you have to add a big number to another big one to get the proper solution?)
Easily fixed by just passing in 0 instead of k and initializing subsets to an empty array
=end
```
