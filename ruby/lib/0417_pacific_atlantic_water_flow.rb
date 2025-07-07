# frozen_string_literal: true

def pacific_atlantic(heights)
  # Create Pacific/Atlantic maps
  pacific = Array.new(heights.size) { Array.new(heights[0].size, false) }
  atlantic = Array.new(heights.size) { Array.new(heights[0].size, false) }

  # Set first/last col to true
  heights.length.times do |idx|
    pacific[idx][0] = true
    atlantic[idx][heights[0].size - 1] = true
  end

  # Set first/last row to true
  heights[0].length.times do |idx|
    pacific[0][idx] = true
    atlantic[heights.size - 1][idx] = true
  end

  # Flow from first/last cols
  heights.size.times do |idx|
    flow(heights, pacific, idx, 0)
    flow(heights, atlantic, idx, heights[0].size - 1)
  end

  # Flow from first/last rows
  heights[0].size.times do |idx|
    flow(heights, pacific, 0, idx)
    flow(heights, atlantic, heights.size - 1, idx)
  end

  # Add to results if can flow to Pacific/Atlantic
  both_pacific_atlantic = []
  heights.each_with_index do |row, y|
    row.each_with_index do |ele, x|
      both_pacific_atlantic << [y, x] if pacific[y][x] && atlantic[y][x]
    end
  end
  both_pacific_atlantic
end

def flow(heights, ocean, y, x)
  directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
  directions.each do |dy, dx|
    new_y = y + dy
    new_x = x + dx
    next if new_y.negative? || new_x.negative? ||
            new_y >= heights.size || new_x >= heights[0].size ||
            ocean[new_y][new_x] || heights[new_y][new_x] < heights[y][x]

    ocean[new_y][new_x] = true
    flow(heights, ocean, new_y, new_x)
  end
end
