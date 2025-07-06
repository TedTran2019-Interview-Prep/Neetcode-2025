# frozen_string_literal: true

def islands_and_treasure(grid)
  # Put treasure chests into queue
  queue = []
  grid.each do |row, y|
    row.each do |ele, x|
      queue << [y, x] if ele.zero?
    end
  end

  directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
  distance_from_chest = 0
  until queue.empty?
    new_queue = []
    queue.each do |y, x|
      directions.each do |dy, dx|
        new_row = y + dy
        new_col = x + dx
        next if new_row.negative? || new_col.negative? || new_row >= grid.size ||
                new_col >= grid[0].size || grid[new_row][new_col] != 2_147_483_647

        grid[y][x] = distance_from_chest + 1
        new_queue << [new_row, new_col]
      end
    end
    distance_from_chest += 1
    queue = new_queue
  end
end
