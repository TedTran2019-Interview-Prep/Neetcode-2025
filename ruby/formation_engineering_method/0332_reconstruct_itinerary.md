```ruby
=begin
tickets, tickets[i] = [from, to]
departs from JFK
return itinerary w/ smallest lexical order if multiple valid
all tickets once only
at least 1 valid itinerary
reuse ALL tickets

naive: simple DFS
start from JFK
use every single ticket (no repeats)
store order if use all
try every combination

slightly better: DFS but return on first success
aka choose route with smallest lexical order

best: Eulerian path (Hierholzer's algorithm), DFS that consumes edges
Uhhhhhh.. what kind of dark magic is this
- Eulerian path (every edge exactly once)
You're picking the smallest lex node in an effective way (popping better than shifting)
DFS consumes each edge exactly once after all its edges are used in postorder
With Hierholzer's, there are no wrong edges
[Eulerian Path algorithme explained](https://www.youtube.com/watch?v=8MpoO2zA2l4)
I see!
No more edges? -> Add node to solution
...so think about what happens on rewind, aka 5 mins in that video
Only O(E) time complexity since you only visit every edge once
=end
```
