# frozen_string_literal: true

DIRS = [[0, -1], [1, 0], [-1, 0], [0, 1], [1, 1], [1, -1], [-1, 1], [-1, -1]].freeze

def solve_n_queens(n)
  board = Array.new(n) { '.' * n }
  result = []

  dfs = lambda do |board, row, queens_placed|
    if queens_placed == n
      # result << Marshal.load(Marshal.dump(board))
      result << dup_board(board)
      return
    end

    (row...n).each do |new_row|
      n.times.each do |col|
        next if queen_attack?(board, new_row, col, n)

        board[new_row][col] = 'Q'
        # Start from next row, because same row will always be false
        # Column is always attempted from beginning, so need to be tracked
        dfs.call(board, new_row + 1, queens_placed + 1)
        board[new_row][col] = '.'
      end
    end
  end

  dfs.call(board, 0, 0)
  result
end

def queen_attack_in_dir?(board, row, col, dy, dx, n)
  loop do
    row += dy
    col += dx
    break if out_of_bounds?(row, col, n)
    return true if board[row][col] == 'Q'
  end

  false
end

def queen_attack?(board, row, col, n)
  DIRS.any? { |dy, dx| queen_attack_in_dir?(board, row, col, dy, dx, n) }
end

def out_of_bounds?(row, col, n)
  row < 0 || col < 0 || row >= n || col >= n
end

def dup_board(board)
  board.map { |string| string.dup }
end
