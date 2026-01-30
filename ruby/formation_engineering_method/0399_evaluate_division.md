```ruby
=begin
equations
values: real numbers
equations[i] = [a, b] = a / b = values[i]
queries[j] = [c, d], find answer for c / d = ?
return answers to all queries (return -1.0 if can't be found)
input is always valid, no division by 0
not occur in list == undefined

[a, b], [b, c]
a / b = 2.0
eq: a = 2b
eq: b = a/2
b / c = 3.0
eq: b = 3c
eq: c = b/3
what is:
a / c
a can be defined in b
c can be defined in b
eq: 2b / b / 3 = 2b * 3/b = 6
a / c = 6
a = 6c
c = a/6
...
b / a
b can be defined as c
a can be defined as c
3c / 6c = 0.5
eq:
a / e = unknown chars, -1
a / a = 2b / 2b = 1 (This is always the case, it's always 1)
x / x = unknown chars, -1 (undefined / undefined returns undefined)

Isn't this a union find type of problem?
For every equation we're given, we create the two isolations
[a, b] = isolated a/b
[b, c] = isolated b/c
Since we define a in terms of b, b in terms of c, we can determine a in terms of c
Basically we want to find the union of all numbers or isolated lil' islands of connection in the graph
Then if it's all connected, we know we can use other variables to find a solution

Neetcode:
Actually can't determine the value of each variable
if you have:
a / c...
If you have a / b, you need to find: b / c, so the b's cancel and you get a / b.
Map every numerator to every denominator (graph problem), every denominator to every enumerator
[a / b = 2] * [b / c = 3] = 6
a -> b -> c
a -> c [2 * 3]
b -> a [1 / 2] (inverse)
Make it an directed graph:
if you go ->, edge value
if you go <-, inverse of edge value
Then DFS or BFS on graph to find out values of all equations
=end
```
