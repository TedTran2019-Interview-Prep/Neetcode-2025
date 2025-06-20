```ruby
=begin
Instead of routes as nodes, use bus stops
Create a map of stop: bus (that travels along a route)
Add source stop to queue
until queue is empty
    for each stop, check the bus
        next if bus already visited
        add to visited buses

        for each stop route within the bus (get through original routes map)
            next if stop already visited
            add to visited stops

            return if next stop == target
            add next stops to new queue
    replace queue with new queue
-1
=end
```

```ruby
=begin
You're only counting number of transfers (aka routes you get on)
Each route has xyz amount of stops, and they're all interchangeable
If you knew:
Starting route (Let's say 5, if it's a junction, 5/8)
Ending route (Let's say 11), once you reach this, return! That's it
All you'd need to do is BFS on the route map to see if you can reach route 11 from route 5
So you'd need a map of which route is connected to which route.

How do you make the route -> route map?
First make this map:
1: in route 0
2: in route 0
7: in route 0, route 1
3: in route 1
6: in route 1

Then for stops with 1+ route, start creating connections
0 -> 1, 1 -> 0 (It's bidirectional)
Only add to route map if doesn't already exist
E,g it can be ROUTE: set of ROUTES connected with

Once you have these two maps
Get starting route(s) = array of starting routes
Get ending route(s) = Make it a set (If it's within these, return!)

Once you have these two maps + starting/ending info
queue = [starting routes]
buses = 0
until queue.empty?
    new_queue = blah blah
    buses increment
    queue.each do node
        if route node exists in ending routes set, return
        process node (check which nodes this node travels to and add to new queue)
    queue = new_queue
return -1

Don't forget to deal with looping routes! Don't revisit already_visited routes
Return 0 if you don't need to get on a bus at all instead of 1
(This is the case where you're at the exact stop you need to be on, not in the same route but a different stop!)
=end
```
