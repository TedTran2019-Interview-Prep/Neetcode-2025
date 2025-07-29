# Given a set of coordinates of bishop positions
# Size of board isn't given (can be anything)... can't go from edges of board inwards
# Checking from every diagonal direction from every bishop seems inefficient
# Can only work with coordinate positions
# * * *
# * * *
# * * *
# [0, 0] -> [1, 1] -> [2, 2] on a diagonal... [x - y], forwards
# [0, 2] -> [1, 1] -> [2, 0] on a diagnal... [x + y], backwards
# (n * (n - 1)) / 2 = formula for # of unique pairs given n elements
def pairs_of_attacking_bishops(bishops)
  forwards = Hash.new(0)
  backwards = Hash.new(0)

  bishops.each do |x, y|
    forwards[x - y] += 1
    backwards[x + y] += 1
  end

  pairs = 0
  forwards.each_value { |count| pairs += (count * (count - 1)) / 2 }
  backwards.each_value { |count| pairs += (count * (count - 1)) / 2 }
  pairs
end

# Test case: Bishops form two attacking pairs
bishops = [[0, 0], [2, 2], [1, 2], [3, 0]]
puts pairs_of_attacking_bishops(bishops) == 2

# Test case: Bishops form no attacking pairs
bishops = [[0, 0], [1, 3], [3, 4], [9, 6]]
puts pairs_of_attacking_bishops(bishops) == 0

# Test case: Bishops form multiple attacking pairs
bishops = [[1, 1], [2, 2], [5, 3], [6, 2], [5, 0], [0, 5]]
puts pairs_of_attacking_bishops(bishops) == 3

# Test case: Bishops form attacking pairs on both diagonals
bishops = [[0, 0], [3, 3], [6, 6], [0, 6], [6, 0]]
puts pairs_of_attacking_bishops(bishops) == 6

# Test case: Bishops form attacking pairs on a single diagonal
bishops = [[0, 4], [1, 3], [2, 2], [3, 1], [4, 0]]
puts pairs_of_attacking_bishops(bishops) == 10

# Test case: Single bishop, no attacking pairs
bishops = [[0, 0]]
puts pairs_of_attacking_bishops(bishops) == 0

# Test case: Empty list, no attacking pairs
bishops = []
puts pairs_of_attacking_bishops(bishops) == 0
