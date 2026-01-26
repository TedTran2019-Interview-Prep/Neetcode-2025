```ruby
=begin
4 wheels, 10 slots each that can freely rotate
What if we consider this to be 10,000 nodes?
0000, 0001, 0002... and so on
If a node is 1 away from each other (0000 goes to 0001 and 0009, that's the edge)
Then BFS to find shortest path from node 0000 to node target, that's it
If deadend is found, that path is a brick, so stop it.

deadends = deadends.to_set
return 0 if target == '0000'
return -1 if '0000' in deadends

min_heap = [lock, moves]
Combine deadends + visited-- you don't want to revisit or continue on deadends
until min_heap.empty?
    lock, moves = min_heap.pop

    deadends << lock
    ... gen combination: from 0000 does 1000, 9000, 0100, 0900, and so on
    generate_combinations(lock).each do |child|
        next if child in deadends

        min_heap << lock, moves + 1
    end
end
-1

Wait, the weight is 1 so why even use a heap? Just use a queue...
=end
```

```ruby
=begin
4 circular wheels
10 slots per wheel: 0-9
can rotate freely and wrap around
each move = turn 1 wheel slot
starts at: 0000
deadends: if lock displays any of these codes, wheels of the lock still stop turning + unable to open
target: value of wheels that will unlock
return min total # of turns required to open lock, or -1 if impossible

If this problem didn't have "deadends", how would you solve this?
For each character, see what's the cheapest way to reach it (moving forwards or backwards)
That's it... That would be O(1) where it would be constant time
If it starts at 0000, target was 5555, you would see if going forwards (5 - 0).abs or backwards (0 - 5).abs would be better
Then you pick whatever is lower, add to output, then move onto to the next characer. Answer would be 20.

Now is the issue of deadends: if you hit a deadend as you turn the wheel, that means you have to explore a different path
But you want to find the SHORTEST path, meaning I think here, some sort of BFS solution is ideal maybe?
Let's look at the example:
Target is 0202, start at 0000
Deadends: [0201, 0101, 0102, 1212, 2002]
You have options to try getting any of the 4 characters to their proper place, and you can go forwards/backwards
For wheel 1: try getting to proper place (forwards + backwards, choose what's MINIMUM)
- There's a chance neither is possible and that's okay
Repeat for wheels 2-4
For each "lock" instance, create a new instance where you try to start at every wheel that isn't already matching
Once you get a match, add it back into queue with length
Probably need to make it a priority queue (e.g sorted by # of moves)
If the "match" lock is run into again, that's the output.
If a match lock is never found, return -1.

return 0 in case already matching
convert deadends into a set for easier matching
heap << [0000, solved = false, 0 moves] (min heap by moves)
until heap.empty?
    lock, solved, moves = heap.pop
    return moves if solved

    lock.each_char.with_index do |nbr, idx|
        next if nbr == target[idx]

        Now the actual calculation part...
        For this IDX, find the minimum number of moves to reach target by going <-- and --> and see if it's possible
        Maybe make two functions?
        Rotate clockwise, rotate counterclockwise and pass in nbr + target (Keep strings mutable in Ruby by not using magic comment), compare against set to see any matches stopping either direction. Make sure to pass in duplicate...
        Then add the new lock back in
    end
end
return -1 (didn't find solved lock)

Nvm, my logic is entirely wrong and this solution is completely wrong, time to approach the problem again.
=end
```
