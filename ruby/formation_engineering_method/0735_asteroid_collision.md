```ruby
=begin
asteroids in a row
indice == relative position in space
absolute value == size, sign == direction
+ right, - left
All asteroids move at the exact same speed
Find state of asteroids after all collisions
2 meet:
    same size: both explode
    smaller one explodes
[3, 5, -6, 2, -1, 4]
-6 pops 3, 5
2 pops -1
4 is unbothered
-6, 2, 4
Start from start of asteroids
Put any positive into stack
[3, 5]
If negative (opposite direction), destroy all relevant until stack is empty, neg is destroyed, or only negs remaining in stack
None of the asteroids have value of 0
=end
```
