```ruby
=begin
n cities connected by flights
array of flights [from, to, price]
src, dst, k
return cheapest price from src to dst with at most k stops, else -1

Problem:
Dijkstra's returns shortest path (chapest flight)
But there might be a more expensive flight within the k stop limit
E.g, cheaper flight takes 2 stops while more expensive takes 1
Do Dijkstra's but whenever number stops is > K, remove it as a possibility?
But how do you go down another path if you already added values based on another?

Naive:
DFS + try every possible route
Short circuit when > K stops

Better: Bellman-Ford algorithm
BFS, O(E*K) time complexity
Can find shortest paths with at most k stops condition
Bellman-Ford can also deal w/ negative weights unlike Dijkstra's, and other conditions
- BFS while keeping track of layers
- Upon finding a cheaper way to reach node, update temp array
- Once temp array completely updated, update the original array
- If you see infinity, skip
- temp array determines cheapest price to reach those so far by this layer
- So even if a future a cheaper flight in the future (later layer) is cheaper, we never calculate it
- With this algorithm, you keep looking at edges!

Plan:
create prices array filled with infinity size of n nodes
cost to hit source destination is 0
(stop + 1) times (if 0 stops, just 1 time maximum for direct flight) times
    create temp prices by duping prices
    go thru flights, getting from to price
        next if prices[from] is infinity aka haven't reached it yet

        if prices[from] + price (price to get here + price to get to next) is less than temp price to reach next
            temp_prices[next] is set to prices[from] + price
    prices = temp prices
return -1 if dst never reached in prices, otherwise return minimum cost to get to destination by that layer
=end
```
