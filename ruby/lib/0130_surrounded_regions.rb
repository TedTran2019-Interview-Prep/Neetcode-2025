# frozen_string_literal: true

def solve(board)
  unsurrounded = []
  # Put first/last col 'O' into unsurrounded
  board.size.times do |idx|
    unsurrounded << [idx, 0] if board[idx][0] == 'O'
    unsurrounded << [idx, board[0].size - 1] if board[idx][board[0].size - 1] == 'O'
  end

  # Put first/last row 'O' into unsurrounded
  board[0].size.times do |idx|
    unsurrounded << [0, idx] if board[0][idx] == 'O'
    unsurrounded << [board.size - 1, idx] if board[board.size - 1][idx] == 'O'
  end

  unsurrounded.each { |y, x| connect(board, y, x) }

  board.each_with_index do |row, y|
    row.each_with_index do |ele, x|
      board[y][x] = 'X' if ele == 'O'
      board[y][x] = 'O' if ele == 'M'
    end
  end
end

def connect(board, y, x)
  return if y.negative? || x.negative? || y >= board.size || x >= board[0].size || board[y][x] != 'O'

  board[y][x] = 'M'
  connect(board, y + 1, x)
  connect(board, y - 1, x)
  connect(board, y, x + 1)
  connect(board, y, x - 1)
end
