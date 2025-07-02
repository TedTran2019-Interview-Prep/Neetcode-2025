```ruby
=begin
partition the string into as many parts as possible
each letter appears at most in ONE part
'ababcc' into 'abab', 'cc'
Each letter = one part
BUT, as many parts as possible
Have to keep original order of string
return size of all parts

If you see a letter again, everything up til' that letter has to be a part of whatever string...
E.g, if you see a, everything up til' the last a: aba
Since there's a b, everything up til' the last b also has to be part of it
a goes from 0..2
b goes from 1..3
c goes from 4..5
A greedy + interval problem? Seems inefficient.

Instead...
Hashmap of character: last position seen
create size = 0
Go through, string
Set ending
If you see anything else with a greater ending, set that to the ending
Increase size as you go through
When you reach ending, that's when you add size to results and reset
=end
```
