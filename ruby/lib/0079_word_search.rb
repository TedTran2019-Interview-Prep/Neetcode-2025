# frozen_string_literal: true

# Avoids set usage
def exist(board, word)
  directions = [[1, 0], [-1, 0], [0, 1], [0, -1]].freeze
  # These two commented out lines are only necessary to pass the test cases on LC
  # Curse Ruby for being a slow language, I guess?
  # tally = word.chars.tally
  # word.reverse! if tally[word[0]] > tally[word[-1]]
  dfs = lambda do |row, col, index|
    return true if index == word.length
    return false if row.negative? || col.negative? || row >= board.length || col >= board[0].length
    return false unless board[row][col] == word[index]

    temp = board[row][col]
    board[row][col] = '#'
    directions.each do |dy, dx|
      return true if dfs.call(row + dy, col + dx, index + 1)
    end
    board[row][col] = temp
    false
  end

  board.length.times do |row|
    board[row].length.times do |col|
      return true if dfs.call(row, col, 0)
    end
  end

  false
end

# Slightly neater, avoids repeated DFS calls
def exist(board, word)
  directions = [[1, 0], [-1, 0], [0, 1], [0, -1]].freeze
  dfs = lambda do |row, col, visited, index|
    return true if index == word.length
    return false if row < 0 || col < 0 || row >= board.length || col >= board[0].length
    return false if visited.include? [row, col]
    return false unless board[row][col] == word[index]

    visited << [row, col]
    directions.each do |dy, dx|
      return true if dfs.call(row + dy, col + dx, visited, index + 1)
    end
    # return true if dfs.call(row + 1, col, visited, index + 1)
    # return true if dfs.call(row - 1, col, visited, index + 1)
    # return true if dfs.call(row, col + 1, visited, index + 1)
    # return true if dfs.call(row, col - 1, visited, index + 1)
    visited.delete([row, col])
    false
  end

  board.length.times do |row|
    board[row].length.times do |col|
      return true if dfs.call(row, col, Set.new, 0)
    end
  end

  false
end

# Messy solution
def exist(board, word)
  dfs = lambda do |row, col, visited, index|
    return true if index >= word.length
    return false if row < 0 || col < 0 || row >= board.length || col >= board[0].length
    return false if visited.include? [row, col]
    return false unless board[row][col] == word[index]

    visited << [row, col]
    return true if dfs.call(row + 1, col, visited, index + 1)
    return true if dfs.call(row - 1, col, visited, index + 1)
    return true if dfs.call(row, col + 1, visited, index + 1)
    return true if dfs.call(row, col - 1, visited, index + 1)

    visited.delete([row, col])
    false
  end

  board.length.times do |row|
    board[row].length.times do |col|
      next unless board[row][col] == word[0]

      visited = Set.new
      visited << [row, col]
      return true if dfs.call(row + 1, col, visited, 1)
      return true if dfs.call(row - 1, col, visited, 1)
      return true if dfs.call(row, col + 1, visited, 1)
      return true if dfs.call(row, col - 1, visited, 1)
    end
  end

  false
end
