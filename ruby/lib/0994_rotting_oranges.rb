# frozen_string_literal: true

def oranges_rotting(grid)
  # Get coordinates of rotting oranges
  queue = []
  grid.each_with_index do |row, y|
    row.each_with_index do |ele, x|
      queue << [y, x] if ele == 2
    end
  end

  directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
  minutes = 0
  until queue.empty?
    new_queue = []
    queue.each do |y, x|
      directions.each do |dy, dx|
        new_row = y + dy
        new_col = x + dx
        next if new_row.negative? || new_col.negative? ||
                new_row >= grid.length || new_col >= grid[0].length ||
                grid[new_row][new_col] != 1

        grid[new_row][new_col] = 2
        new_queue << [new_row, new_col]
      end
    end
    break if new_queue.empty?

    minutes += 1
    queue = new_queue
  end

  grid.any? { |row| row.any? { |el| el == 1 } } ? -1 : minutes
end
