```ruby
=begin
n people labeled 1 to n
1 person is the town judge
1. judge trusts nobody
2. everybody except for the judge himself trusts the town judge
3. exactly 1 person that satisfies above 2 properties
trust[i] = [a, b] aka person a trust person b
directed graph
Is there a person who trusts nobody, but everybody trusts them?
Aka the graph of person -> [people they trust] length is 0
But the graph of person -> [people who trust them] length is n - 1
Information needed is the above: get that info then confirm if any people meet those conditions

A slightly more efficient (but same space/time complexity) way of handling this:
Instead of using maps, use arrays
Then in each array, keep track of a person + how many people they trust + how many people trust them
Then just compare the numbers-- there's no need to have an array storing the people if we're only using the length
=end
```
