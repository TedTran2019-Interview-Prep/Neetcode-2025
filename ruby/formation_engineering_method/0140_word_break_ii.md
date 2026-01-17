```ruby
=begin
string s, dict of strings wordDict
add spaces in s to construct a sentence where each word is a valid dict word
return all sentences in any order
same word may be used multiple times

meaning we're dealing with partitions
catsanddog
cats and dog
cat sand dog

Naive: try a space in every spot to construct sentences, most likely will time out
Better:
We can form a Trie... or skip it, since no Trie just means some trash results but that's OK, just going through the entire string which isn't a big deal
If it's the end of a word, you can either choose to CONTINUE the word or stop the word here and start forming a
new word.

results = holds all valid sentences
words_array = a single sentence
str = single word
Iterate through the string
    if it forms a valid word, this is where the break happens
        - One branch starts a new word
        - Other branch keeps adding to old word
Keep strings mutable
=end
```
