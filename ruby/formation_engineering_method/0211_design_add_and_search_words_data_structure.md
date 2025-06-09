```ruby
=begin
Data structure that supports
1. add new words
2. if a string matches with any previous added string
Words can contain '.' as wildcards
Aka use a trie
.ad, b..
Whenever run into '.', behavior changes. Run through all keys on that level, trying each single hashmap.
Use an array of hashes instead of a single hash to travel through

Do both BFS + DFS approaches
DFS is much better since you can avoid a lot of unnecessary computation if the word is found early.
Also, BFS kind of requires a lot of messy array manipulation.
=end
```
