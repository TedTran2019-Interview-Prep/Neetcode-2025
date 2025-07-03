# frozen_string_literal: true

require 'set'

def count_patterns(number_of_keys)
  # Define skip relationships
  skip = Array.new(10) { Array.new(10, 0) }
  skip[1][3] = skip[3][1] = 2
  skip[1][7] = skip[7][1] = 4
  skip[3][9] = skip[9][3] = 6
  skip[7][9] = skip[9][7] = 8
  skip[1][9] = skip[9][1] = 5
  skip[3][7] = skip[7][3] = 5
  skip[4][6] = skip[6][4] = 5
  skip[2][8] = skip[8][2] = 5
  skip[7][3] = skip[3][7] = 5
  a = count_pattern(number_of_keys, 1, skip) * 4
  b = count_pattern(number_of_keys, 2, skip) * 4
  c = count_pattern(number_of_keys, 5, skip)
  a + b + c
end

def count_pattern(number_of_keys, starting_nbr, skip)
  count = 0
  visited = Set.new
  dfs = lambda do |current_nbr, length|
    if length == number_of_keys
      count += 1
      return
    end

    (1..9).each do |nbr|
      next if visited.include?(nbr)

      middle = skip[current_nbr][nbr]
      # Skip if middle value exists and it hasn't been visited
      next if !middle.zero? && !visited.include?(middle)

      visited << nbr
      dfs.call(nbr, length + 1)
      visited.delete(nbr)
    end
  end

  visited << starting_nbr
  dfs.call(starting_nbr, 1)
  count
end

puts count_patterns(1)
puts count_patterns(2)
puts count_patterns(3)
puts count_patterns(4)
puts count_patterns(5)
puts count_patterns(6)
puts count_patterns(7)
puts count_patterns(8)
puts count_patterns(9)
