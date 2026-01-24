```ruby
=begin
English lowercase letters in a diff order
Order is some permutation of lowercase letters
Given sequence of words, return true if words are sorted lexicographically in alien language
Basically order is the alpahbet order
Then see if words is properly sorted
Blank char is less than all other chars

Naive brute force:
Look at all words in words, making sure 1st comes before 2nd before 3rd....
Check first letter of comparisons and check order within "order", if same, repeat for 2nd, 3rd, and so on

Better approach:
Aka need to check between two words easier
Or you could look at order, and match each word according to index value
Then you can just compare w1, w2 and make sure w1 is always less than w2 or return false

Eager vs deferred vs lazy for enumerators
Ruby Lazy method, constructs chains of operations without evaluating them immediately
Eager -> turns it back to a regular enumerator
=end
```
