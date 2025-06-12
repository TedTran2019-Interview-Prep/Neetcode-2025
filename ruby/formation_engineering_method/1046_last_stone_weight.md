```ruby
=begin
Each turn, choose two heaviest stones and smash em'
x == y, both are destroyed
x != y, x is less than y, x is destroyed and y has weight y - x
At the end of the game, return last stone (or 0 if on stone)
Basically heapify everything
until heap size is <= 1
    pop two largest
    SMASH em
    add result back into heap if it's not 0
    rinse and repeat
=end
```
