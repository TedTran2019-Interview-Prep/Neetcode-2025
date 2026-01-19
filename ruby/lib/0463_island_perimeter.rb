# frozen_string_literal: true

def island_perimeter(grid)
  visited = Set.new
  directions = [[1, 0], [-1, 0], [0, 1], [0, -1]].freeze
  perimeter = 0
  dfs = lambda do |row, col|
    visited << [row, col]
    directions.each do |dy, dx|
      ny = dy + row
      nx = dx + col
      next if visited.include?([ny, nx])

      if out_of_bounds?(ny, nx, grid) || grid[ny][nx].zero?
        perimeter += 1
        next
      end

      dfs.call(ny, nx)
    end
  end
  grid.each_with_index do |row, y|
    row.each_with_index do |col, x|
      next if visited.include?([y, x]) || out_of_bounds?(y, x, grid) || col.zero?

      dfs.call(y, x)
    end
  end
  perimeter
end

def out_of_bounds?(row, col, grid)
  row.negative? || col.negative? || row >= grid.length || col >= grid[0].length
end
