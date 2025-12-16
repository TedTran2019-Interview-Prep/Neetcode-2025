```ruby
=begin
Given integer array o size n, find all elements that appear more than n/3 times
In #1, have to do that one majority poll algorithm
E.g, set candidate to # if count is 0
count +1 if it's candidate, else -1
How do I expand it to n/3 instead of n/2?
Doing this with O(N) space is just using a hashmap...

If 1 element appears 100% of the time, it'll be that element
You can have 66% 34% too, for 2.
34% 33% 33% would count as 1

What if you kept track of two candidates at a time?
Keep track of two most common candidates
Do another pass to see their actual counts
See if each count is greater than n/3
=end
```
