# Plan:
#   # row, col
#   DIRS = [1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [-1, -1], [1, -1], [-1, 1]
#   DIRS.each do |dir|
#     dy, dx = dir
#     row + dy = new_row
#     col + dx = new_col
#     next if new row or new col is out of bounds (less than 0 or >= 8)
#     piece = board[new_row][new_col]
#     if piece isn't white, go next
#     else
#       function that takes in new_col/new_col, dy dx, matrix and returns true/false
#       if that function returns true, true

#     false
#   end

# def whatever(matrix, x, y, dy, xy)
#   until out of bounds
#     if == 'black' return true
#     if == 'empty space' return false

#   false

def is_legal_move(matrix, row, col)
  dirs = [[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [-1, -1], [1, -1], [-1, 1]]
  dirs.each do |dir|
    dy, dx = dir
    new_row = row + dy
    new_col = col + dx
    next if out_of_bounds(new_row, new_col)

    piece = matrix[new_row][new_col]
    next unless piece == 'W'

    return true if check_line(matrix, new_row, new_col, dy, dx)
  end

  false
end

def out_of_bounds(row, col)
  row < 0 || col < 0 || row > 7 || col > 7
end

def check_line(matrix, row, col, dy, dx)
  until out_of_bounds(row, col)
    return true if matrix[row][col] == 'B'
    return false if matrix[row][col] == '*'

    row += dy
    col += dx
  end
  false
end

def print_test_case(board, row, col, expected)
  puts is_legal_move(board, row, col) == expected
end

print_test_case([
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', 'B', 'W', '*', '*', '*'],
                  ['*', '*', '*', 'W', 'B', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*']
                ], 2, 3, false)

print_test_case([
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', 'B', 'W', '*', '*', '*'],
                  ['*', '*', '*', 'W', 'B', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*']
                ], 2, 4, true)

print_test_case([
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', 'B', 'W', '*', '*', '*'],
                  ['*', '*', '*', 'W', 'B', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*']
                ], 3, 5, true)

print_test_case([
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', 'B', 'W', '*', '*', '*'],
                  ['*', '*', '*', 'W', 'B', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*']
                ], 4, 5, false)

print_test_case([
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', 'B', 'W', '*', '*', '*'],
                  ['*', '*', '*', 'W', 'B', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*']
                ], 5, 5, false)

print_test_case([
                  ['B', 'W', 'W', 'W', 'W', 'W', 'W', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', 'B', 'W', '*', '*', '*'],
                  ['*', '*', '*', 'W', 'B', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*']
                ], 0, 7, true)

print_test_case([
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', 'B', 'W', '*', '*', '*'],
                  ['*', '*', '*', 'W', 'B', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*'],
                  ['*', '*', '*', '*', '*', '*', '*', '*']
                ], 2, 2, false)
