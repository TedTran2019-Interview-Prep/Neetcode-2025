```ruby
=begin
numCourses courses to take, 0 - length - 1
array of prereqs [a, b]
must take course b to take course a
[0, 1] -> must take course 1 before course 0
true if you can finish all courses, otherwise false

courses are nodes, pairs are edges
create adjacency list (course: list of prereqs)
DFS, go thru every node, delete prereq from called node if it's reachable (aka no prereqs)
O(N+P) time complexity
visited set: if already visited, there's a loop aka can't be completed
=end
```
