```ruby
=begin
n nodes, from 1 to n (2 nodes is 1, 2)
times, times[i] = (u, v, w): source, target, time it takes to travel
send a signal from k -> minimum time for all n nodes to receive signal
If not all nodes can receive, return -1
Isn't this just djikstras?
I guess not, because you want to reach ALL nodes + time passing happens at the same time
And if another node has already been traveled to, just ignore it
Let's use a min heap to keep track of minimum travel values!
Kinda reminds me of a time-based flood fill in a way
uniform offset is okay for a heap

pseudocode:
create visited nodes set
set min heap (needs to store travel time, destination node)
add k (the starting node) into min heap with travel time of 0
minimum_time = 0
until min heap is empty?
    pop smallest value from heap (SKIP if already visited that node)
        add that value to visited nodes
        subtract all other values in heap by that smallest value
        add that smallest value to minimum time
        add target nodes from that destination node to min heap
return minimum_time if visited nodes is equal to number of nodes else -1

Nvm, redo this-- you can just do Djikstras and that also solves the problem. No need for my
complicated heap inner array modification style solution haha.
=end
```
