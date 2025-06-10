```ruby
=begin
mxn grid of chars board
string word, return true if word exists in grid
adjacent cells (4 directions)
same letter cell may not be used more than once

go thru each element of the board
    if the el matches first char of word, go through with search
    add row/col to visited set
    return true if search finds
    what should the search be like?
        backtrack call in all 4 directions, taking in row/col/set/index
            return true if index >= word.length
            return if out of bounds
            return if already visited
            return if word[index] doesn't match board row/col
            false
false since nothing found the word

This problem is pretty similar to word search ii, except without the tries.
It also requires hardcoding for edge cases to pass LC because Ruby is such a slow language.
I guess it's a type of backtracking flood-fill problem where you flood outwards from
every single square, avoiding already visited ones.
=end
```
