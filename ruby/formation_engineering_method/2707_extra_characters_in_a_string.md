```ruby
=begin
s, dictionary
break s into 1+ non-overlapping substrings
each substring present in dictionary
may be extra chars in s not present in any substrings
minimum # of extra chars left over if s is broken up optimally

Can use a trie to quickly see if this is a valid char up to xyz point
"sayhelloworld"
s doesn't lead to a valid char, neither does a/y so skip (3 unused)
hello -> hello
world -> world
"leetscode"
leet -> leet
s leads nowhere
code -> code
What is meant by non-overlapping? 1 letter can't be used for two words, right?

What happens if
"leet, leets, code"
leet -> s (nowhere) -> code
leets -> code
At every "completion" point, need to see if you want to continue or start anew
This problem is similar to Word Break II, but requires a trie because you're trying to get the minimum unused chars

word = ''
min_extra = Infinity
extra = 0
iterate through string (start idx to end)
    check if word so far is a prefix
        if prefix, keep going
        if not prefix, add word length to extra chars and restart word
        if it's a word, TIME TO BRANCH
            one branch makes a new call, starting at new index
                which means current extra + this call = how many extras it took
            other branch keeps adding to the word (aka if prefix keep going)
return min extra

I understand why my solution fails now...
Sometimes even if a prefix is valid, you may still want to skip.

Better mental model for reiteration:
For each character, are you skipping it or taking it?
leetscode
leet, code, leetcode
l -> skip or take?
skip = used + 1, next index
not skip = next index

For each index
We can skip the letter at this index entirely (extra + 1), move on (Branch)
We can go through forming a word...
    If it forms a word in dict, we branch:
        Keep adding to the word (continue loop)
        Or we form a new word, no costs paid up to this point!

Let's use tries to make this a lil' more efficient
=end
```
