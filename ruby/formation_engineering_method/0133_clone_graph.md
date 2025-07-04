```ruby
=begin
NC solution is way cleaner
Recursively go through to create nodes/set neighbors
Honestly super elegant, damn.
=end
```

```ruby
=begin
Reference of a node in a connected undirected graph
Deep copy of said graph
Iterate through the graph, creating the nodes WITHOUT neighbors
Create a hashmap of old node -> new node
- object id of old node points to new node
Go through graph again, this time placing neighbors in
=end
```
