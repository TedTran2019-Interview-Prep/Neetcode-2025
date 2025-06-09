```ruby
=begin
mxn board of characters, list of string words, return all words on board
Each word constructed from adjacent cells in all directions
Same letter cell may not be used more than once in a word

Create a trie to use
Go through the board, each char does its own recursive call (ALL 4 DIRS, MAKING MORE CALLS)
- Use a set to prevent duplicate letters used within the same "call"
- Use a set to prevent duplicate answers

dirs = all 4 dirs
trie = create trie
insert words into trie
word = []
visited = Set.new
words_found = Set.new

dfs = lambda do |row, col, trie|
    if trie is a word
        join word together, add to words_found

    go through all 4 directions
        next if it's out of bounds
        next if trie[char] doesn't exist
        next if row/col combination already used

        add to word/visited
        call dfs
        remove from word/visited

go through every char on board
    add char to word
    add row/col to visited
    call dfs on row/col if trie[char] exists
    remove char from word
    remove row/col from visited
words_found.to_a
=end
```
