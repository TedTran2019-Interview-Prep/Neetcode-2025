# frozen_string_literal: true

def num_islands(grid)
  islands = 0
  grid.each_with_index do |row, y|
    row.each_with_index do |element, x|
      next if element == '0'

      islands += 1
      flood_fill(grid, y, x)
    end
  end
  islands
end

def flood_fill(grid, y, x)
  return if y.negative? || x.negative? || y >= grid.length || x >= grid[0].length
  return if grid[y][x] == '0'

  directions = [[1, 0], [-1, 0], [0, -1], [0, 1]].freeze
  grid[y][x] = '0'
  directions.each { |dy, dx| flood_fill(grid, y + dy, x + dx) }
end
