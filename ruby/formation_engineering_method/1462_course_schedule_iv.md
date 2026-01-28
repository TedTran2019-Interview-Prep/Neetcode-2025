```ruby
=begin
numCourses, 0 to numCourses - 1
prerequisites[i] = [a, b]
take course a before take course b (directed edge)
prerequisites can be indirect
queries [u, v], is course u a prereq of v?
answer: answer[j] is answer to jth query, aka array of booleans

Naive:
Form a graph
See if you can reach course v from course u in the graph, true if so otherwise false
Repeat for every [u, v] pair
O(N) * length of queries at worst
Cache results (if you're at this prereq can you reach this target or not?)
=end
```
