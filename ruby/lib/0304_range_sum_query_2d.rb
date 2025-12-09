# frozen_string_literal: true

class NumMatrix
  #     :type matrix: Integer[][]
  def initialize(matrix)
    @prefix_matrix = Array.new(matrix.length + 1) { Array.new(matrix[0].length + 1, 0) }
    matrix.each_with_index do |row, y|
      prefix = 0
      row.each_with_index do |ele, x|
        prefix += ele
        above = @prefix_matrix[y][x + 1]
        @prefix_matrix[y + 1][x + 1] = prefix + above
      end
    end
  end

  #     :type row1: Integer
  #     :type col1: Integer
  #     :type row2: Integer
  #     :type col2: Integer
  #     :rtype: Integer
  def sum_region(row1, col1, row2, col2)
    # conversion
    row1 += 1
    col1 += 1
    row2 += 1
    col2 += 1
    bottom_right = @prefix_matrix[row2][col2]
    above = @prefix_matrix[row1 - 1][col2]
    left = @prefix_matrix[row2][col1 - 1]
    left_above = @prefix_matrix[row1 - 1][col1 - 1]
    bottom_right - above - left + left_above
  end
end
