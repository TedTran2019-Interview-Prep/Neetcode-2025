# frozen_string_literal: true

# Memoized only works if you use a 3D array instead of a hashmap
def number_of_paths(grid, k)
  max_y = grid.length - 1
  max_x = grid[0].length - 1
  constant = 10**9 + 7
  memo = Array.new(grid.length) { Array.new(grid[0].length) { Array.new(k, -1) } }
  dfs = lambda do |y, x, remain|
    return 0 if y > max_y || x > max_x
    return (remain + grid[y][x]) % k == 0 ? 1 : 0 if y == max_y && x == max_x
    return memo[y][x][remain] if memo[y][x][remain] > -1

    # Remember that paths only care about the remainder, not the total
    down = dfs.call(y + 1, x, (remain + grid[y][x]) % k)
    right = dfs.call(y, x + 1, (remain + grid[y][x]) % k)
    memo[y][x][remain] = down + right
  end
  dfs.call(0, 0, 0) % constant
end

# Naive
def number_of_paths(grid, k)
  max_y = grid.length - 1
  max_x = grid[0].length - 1
  constant = 10**9 + 7
  dfs = lambda do |y, x, remain|
    return 0 if y > max_y || x > max_x

    val = grid[y][x]
    return (remain + val) % k == 0 ? 1 : 0 if y == max_y && x == max_x

    down = dfs.call(y + 1, x, remain + val)
    right = dfs.call(y, x + 1, remain + val)
    down + right
  end
  dfs.call(0, 0, 0) % constant
end
