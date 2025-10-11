```ruby
=begin
s, wordDict, true if s can be segmented as words in dict
same word can be reused
all of S has to be used up (but not all of wordDict)

check l -> le -> lee...
until you hit a word, if you do, start at next point
(If first letter doesn't result in win, return false)
E.g issue is that you might hit into something like
cat, cats -> two branches to try
catsandog
cat, cats
cat -> sand
cats -> and
og isn't a word, both fail
False!

"Forcing" decision tree
Start at index 0
Try [cats, dog, sand, and, cat]
cats and cat are two valid trees
Move to: index 0 + 4, 0 + 3
Try [cats, dog, sand, and, cat]
cats -> and -> move to index 4 + 3
cat -> sand -> move to index 3 + 4
Try [cats, dog, sand, and, cat]
False!
Remember to cache indexes (True or false)
Out of bounds by 1 == true
=end
```
