# frozen_string_literal: true

# Memoized
def longest_increasing_path(matrix)
  dirs = [[0, 1], [0, -1], [1, 0], [-1, 0]].freeze
  memo = {}
  dfs = lambda do |y, x|
    longest_path = 1 # Includes starting square
    key = [y, x]
    return memo[key] if memo.key?(key)

    dirs.each do |dy, dx|
      new_y = y + dy
      new_x = x + dx
      next if new_y.negative? || new_x.negative? ||
              new_y >= matrix.length || new_x >= matrix[0].length ||
              matrix[new_y][new_x] <= matrix[y][x]

      candidate_path = dfs.call(new_y, new_x) + 1
      longest_path = candidate_path if candidate_path > longest_path
    end
    memo[key] = longest_path
  end

  longest_path = 0
  matrix.length.times do |y|
    matrix[0].length.times do |x|
      longest_path = [dfs.call(y, x), longest_path].max
    end
  end
  longest_path
end

# Naive
def longest_increasing_path(matrix)
  dirs = [[0, 1], [0, -1], [1, 0], [-1, 0]].freeze
  dfs = lambda do |y, x, path, prev_value|
    return 0 if y.negative? || x.negative? || y >= matrix.length || x >= matrix[0].length
    return 0 if matrix[y][x] <= prev_value

    longest_path = path
    dirs.each do |dy, dx|
      longest_path = [dfs.call(y + dy, x + dx, path + 1, matrix[y][x]), longest_path].max
    end
    longest_path
  end

  longest_path = 0
  matrix.length.times do |y|
    matrix[0].length.times do |x|
      longest_path = [dfs.call(y, x, 1, -Float::INFINITY), longest_path].max
    end
  end
  longest_path
end
