# Two strings: x/y, create an interleaving by taking first character of either
# Append to form new string
# Valid interleavings:
# 1. len(interleaving) == len x + len y
# 2. interleaving - x = y and vice versa (means order of x/y have to be perserved AND counts perserved)
# 3. x/y both appear as subsequences in interleaving
#
# Given: x/y/s-- is s a valid interleaving of x/y?
# Initial check: check condition 1
# Then check 2: make sure the interleaving string has all the characters of x + y
# Check 3:
# ABC, BCD, BABCCD
#
# We're asked to use backtracking to practice for this approach.
# To do this (doing check 3): generate all valid interleavings and check if S matches with any. Doing this, you don't even need to check 1/2
# Take from A or B
#
# Plan:
# results = []
# dfs = lambda do |index_a, index_b, string|
#   if string.length == s.length
#     results << string
#     return
#
#   dfs (index_a + 1, index_b, string + s[index_a]) IF not out of bounds
#   same for index_b
#
# dfs.call(0, 0, '')
# results

def is_interleaving(x, y, s)
  # Condition 1
  return false unless x.length + y.length == s.length

  # Condition 2
  s_map = s.split('').tally
  xy_map = Hash.new(0)
  x.each_char { |char| xy_map[char] += 1 }
  y.each_char { |char| xy_map[char] += 1 }
  return false unless s_map == xy_map

  # Condition 3
  results = []
  dfs = lambda do |index_x, index_y, string|
    if string.length == s.length
      results << string
      return
    end

    dfs.call(index_x + 1, index_y, string + x[index_x]) if index_x < x.length
    dfs.call(index_x, index_y + 1, string + y[index_y]) if index_y < y.length
  end

  dfs.call(0, 0, '')
  results.any? { |result| result == s }
end

puts(is_interleaving('XXXXX', 'YYYYY', 'shorter') == false)
puts(is_interleaving('X', 'Y', 'longer') == false)
puts(is_interleaving('X', 'Y', 'XY') == true)
puts(is_interleaving('X', 'Y', 'YX') == true)
puts(is_interleaving('X', 'Y', 'XX') == false)
puts(is_interleaving('X', 'Y', 'YY') == false)
puts(is_interleaving('ABC', 'D', 'ABCD') == true)
puts(is_interleaving('ABC', 'D', 'ABDC') == true)
puts(is_interleaving('ABC', 'D', 'ADBC') == true)
puts(is_interleaving('ABC', 'D', 'DABC') == true)
puts(is_interleaving('AABCC', 'DBBCA', 'AADBBCBCAC') == true)
puts(is_interleaving('ABC', 'BCD', 'BABCCD') == true)
puts(is_interleaving('ABC', 'BCD', 'ABCBCD') == true)
puts(is_interleaving('ABC', 'BCD', 'BCDABC') == true)
puts(is_interleaving('ABC', 'BCD', 'BCABDC') == true)
puts(is_interleaving('ABC', 'BCD', 'BABCDD') == false)
puts(is_interleaving('ABC', 'BCD', 'ABBCCD') == true)
puts(is_interleaving('ABC', 'BCD', 'DCCBBA') == false)
puts(is_interleaving('ABC', 'BCD', 'ABBDCC') == false)
puts(is_interleaving('ABC', 'BCD', 'ACBBCD') == false)
