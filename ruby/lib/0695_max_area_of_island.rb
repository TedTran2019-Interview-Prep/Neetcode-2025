# frozen_string_literal: true

def max_area_of_island(grid)
  max_area = 0
  grid.each_with_index do |row, y|
    row.each_with_index do |ele, x|
      next if ele.zero?

      area = flood_fill_count(grid, y, x)
      max_area = [area, max_area].max
    end
  end
  max_area
end

def flood_fill_count(grid, y, x)
  count = 0
  flood_fill = lambda do |row, col|
    return if row.negative? || col.negative? || row >= grid.length || col >= grid[0].length || grid[row][col].zero?

    grid[row][col] = 0
    count += 1
    [[1, 0], [-1, 0], [0, 1], [0, -1]].each do |dy, dx|
      new_row = row + dy
      new_col = col + dx
      flood_fill.call(new_row, new_col)
    end
  end
  flood_fill.call(y, x)
  count
end
