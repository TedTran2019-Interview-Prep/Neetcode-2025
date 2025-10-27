# frozen_string_literal: true

def set_zeroes(matrix)
  matrix.each_with_index do |row, y|
    row.each_with_index do |ele, x|
      expand(matrix, y, x) if ele.zero?
    end
  end

  matrix.each_with_index do |row, y|
    row.each_with_index do |ele, x|
      matrix[y][x] = 0 if ele == 2**32
    end
  end
end

def expand(matrix, y, x)
  (0...matrix.length).each do |new_y|
    matrix[new_y][x] = 2**32 unless matrix[new_y][x].zero?
  end
  (0...matrix[0].length).each do |new_x|
    matrix[y][new_x] = 2**32 unless matrix[y][new_x].zero?
  end
end
