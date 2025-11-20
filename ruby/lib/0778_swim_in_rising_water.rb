# frozen_string_literal: true

def swim_in_water(grid)
  min_heap = Heap.new { |a, b| a[2] < b[2] } # y, x, value
  last_row = grid.length - 1
  last_col = grid[0].length - 1
  min_heap << [0, 0, grid[0][0]]
  dirs = [[0, 1], [1, 0], [0, -1], [-1, 0]].freeze
  visited = Set.new
  max_time = 0
  until min_heap.empty?
    y, x, time = min_heap.pop
    visited << [y, x]
    max_time = time if time > max_time
    return max_time if y == last_row && x == last_col

    dirs.each do |dy, dx|
      new_y = dy + y
      new_x = dx + x
      next if visited.include?([new_y, new_x])
      next if new_y.negative? || new_x.negative? || new_y > last_row || new_x > last_col

      min_heap << [new_y, new_x, grid[new_y][new_x]]
    end
  end
end
