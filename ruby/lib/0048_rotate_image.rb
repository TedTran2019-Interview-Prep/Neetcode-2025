# frozen_string_literal: true

def rotate(matrix)
  transpose(matrix)
  matrix.map!(&:reverse)
end

def transpose(matrix)
  (0...matrix.length).each do |x|
    (x...matrix.length).each do |y|
      matrix[y][x], matrix[x][y] = matrix[x][y], matrix[y][x]
    end
  end
end
