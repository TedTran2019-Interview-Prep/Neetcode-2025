# frozen_string_literal: true

def spiral_order(matrix)
  spiral = []
  # goal_length = matrix.flatten.length
  goal_length = matrix[0].length * matrix.length
  top = 0
  left = 0
  right = matrix[0].length - 1
  bottom = matrix.length - 1
  until spiral.length == goal_length
    (left..right).each do |x|
      break if spiral.length == goal_length

      spiral << matrix[top][x]
    end
    top += 1

    (top..bottom).each do |y|
      break if spiral.length == goal_length

      spiral << matrix[y][right]
    end
    right -= 1

    right.downto(left).each do |x|
      break if spiral.length == goal_length

      spiral << matrix[bottom][x]
    end
    bottom -= 1

    bottom.downto(top).each do |y|
      break if spiral.length == goal_length

      spiral << matrix[y][left]
    end
    left += 1
  end
  spiral
end
