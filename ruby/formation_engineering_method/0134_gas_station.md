```ruby
=begin
n gas stations along a circular route
gas at ith station is gas[i]
unlimited gas tank, costs cost[i] of gas to travel from 1th to next i + 1 station
gas, cost... Can you travel around the circuit once in the clockwise direction?
Guaranteed unique solution
gas and cost have same length confirmed
gas and cost can be 0
both gas and cost have at least length 1
solution guaranteed to be unique

Looking at:
[1, 2, 3, 4, 5]
[3, 4, 5, 1, 2]
[-2, -2, -2, 3, 3]
If you choose:
1 gas, it'd cost 3 to travel to next
2 gas, cost 4 to travel to next
3 gas, takes 5 to travel to next
4 gas, takes 1 to travel to next
5 gas, takes 2 to travel to next
Remember that you can start at any station for free (no travel cost)
Gas sum has to be greater or equal to cost sum

Brute force solution (N^2):
- Try every starting point and see if you can complete a full cycle

Better solution O(N):
- Single unique solution
- Since gas >= costs, guaranteed to do circuit (greedy)
Greedy problems: Assume that it works then pray when running the code
The hard part about this problem is finding out the "greedy trick" for it

return false unless gas.sum >= cost.sum
total = 0
starting_index = 0
go from 0 to array.length - 1
    do diff is gas - cost
    add that total
    if total is negative, reset it back to zero
    else set starting index to idx + 1
starting_index
=end
```
