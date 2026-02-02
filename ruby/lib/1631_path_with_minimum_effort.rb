# frozen_string_literal: true

def minimum_effort_path(heights)
  directions = [[1, 0], [-1, 0], [0, 1], [0, -1]].freeze
  max_row = heights.length - 1
  max_col = heights[0].length - 1
  # Min heap storing [[row, col], max effort on this path]
  heap = Heap.new { |a, b| a[1] < b[1] }
  heap << [[0, 0], 0]
  visited = Set.new
  until heap.empty?
    coordinates, effort = heap.pop
    row, col = coordinates
    return effort if row == max_row && col == max_col

    visited << coordinates
    directions.each do |dy, dx|
      new_row = dy + row
      new_col = dx + col
      next if new_row.negative? || new_col.negative? || new_row > max_row || new_col > max_col
      next if visited.include?([new_row, new_col])

      new_effort = (heights[new_row][new_col] - heights[row][col]).abs
      heap << [[new_row, new_col], [effort, new_effort].max]
    end
  end
end
