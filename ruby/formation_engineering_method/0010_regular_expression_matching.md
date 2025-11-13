```ruby
=begin
string s, pattern p
implement regexp matching with support for '.' and '*'
'.' matches any SINGLE
'*' matches 0+ or more of the preceding element
Matching should cover the entire input string

Naive:
If match, both +1
If '.', both +1
If not match, return false
Win condition: when both s and p reach the end
If *, match preceding character
    Can choose to duplicate preceding OR to continue normally
aaaa, a*a
a-a, match
[aaa], [*a] subproblems
* can match 0 a's, 1a, 2a, or 3a
If it matches 0 a's, subproblem is: [aaa], [a]
If it matches 1 a's, subproblem is: [aa], [a]
If it matches 2 a's, subproblem is: [a], [a]
If it matches 3 a's, subproblem is: [], [a]

I actually got super close to this one, but what intuitions didn't I catch?
I got the "win con", but not the proper lose cons.
Aka, when pattern is out of bounds, but NOT when string is out of bounds.
I would have known this if I went through easy cases + hard cases.
Then, even though I got the intuition of what to do in each case (., match, not match) etc and also that on each star, you'd either utilize the
star or not utilize it, I couldn't model it properly.
It was very clean to decide the match first e.g, string within bounds, string/pattern matching, or pattern with all-match.
Then you'd really only need to handle the "*" case, which was what made it complicated. The intuition is that you'd check the next character over to see if it's a star, then make decisions based on that.
If it is a star, you can either:
not use star: you keep string where it is, move pattern +2 (skipping the previous char + the star)
use star: you go next char on string (IF IT MATCHES), stay on the pattern
And then you do a simple memoization, and that's it!

The difficult intuition for this problem was:
1. Finding out the proper lose conditions (stopping cases)
2. Realizing you have to preemptively check the next character for a star because you're checking values based on the previous character, e.g they're tied together
=end
```
