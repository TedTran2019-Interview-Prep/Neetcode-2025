```ruby
=begin
max path sum aka: largest left path + node + largest right path
What if a path is negative? Don't take it!
Compare max path sums, only take largest
At any given point, can only return one path (left or right) to a specific node

max_sum = root.val (guaranteed one node)
dfs = lambda do |node|
    return 0 unless node

    left = call dfs
    right = call dfs
    set left to 0 if it's negative
    set right to 0 if it's negative

    sum = left + right + current node
    compare with max sum

    return greatest of left + current node, right + current node
call dfs
max_sum
=end
```
