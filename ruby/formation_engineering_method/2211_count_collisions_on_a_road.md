```ruby
=begin
n cars on an infinitely long road
left -> car, each car present a a unique point
directions: L, R, S
all moving cars have the same speed
moving car in opposite directions collide = +2 collisions
moving car collides with stationary = +1 collisions
after collision, cars can no longer move and still stay where they collided
I think maybe a stack problem?
RLRSLL
Add R (->), add L.
Top of stack is R, so pop both and put in S. Add 2
SR
SRS -> collision, top of stack is right, pop R put in S, +1
SSL -> collision, top of stack is stationary, pop L +1
SSL -> collision, top of stack is stationary, pop L +1
5 collisions
How do deal with past R's with future S's?

Other ways: simulation without stack
current car, left to right
flag is -1 when no car
flag is 0 when stationary car
flag is 1, and incremented when going right (might eventually crash into wall or a left driver)
Shortest: counting
strip initial left, strip initial right
everything else collides, so return length of remaining string - stops
=end
```
