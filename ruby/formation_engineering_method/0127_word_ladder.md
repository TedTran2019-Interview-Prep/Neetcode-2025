```ruby
=begin
beginWord -> endWord
every adjacent pair of words differ by a single letter
beginWord doesn't not need to be in wordList
# of words in shortest transformation sequence from beginWord to endWord
Example:
hit -> cog
hot dot dog lot log cog
hit -> hot -> dot -> dog -> cog (5 words)

Words can travel to another word that only differ by ONE letter
Construct a graph of word -> words that it can travel to
Perform a BFS (keeping track of words visited, do not readd)
Time it takes for BFS to reach final word == win!
If final word cannot be reached, return 0

construct graph function:
    send in begin word and word list
    for that begin word, what is every word in the word list that differs by one char?
    then repeat on every single word in the list (minus itself)
BFS on graph to see if begin word can reach word list

Failed due to time limit... need to find a more efficient way to generate
the adjacency list!
How: for each word, generate a "pattern"
hit becomes *it, h*t, hi*
Find everything that *it matches to
When used, go through all patterns for each word!
=end
```
