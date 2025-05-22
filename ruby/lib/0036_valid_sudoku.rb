# def is_valid_sudoku(board)
#     (0...9).each do |y|
#         row = []
#         col = []
#         (0...9).each do |x|
#             row << board[y][x]
#             col << board[x][y]
#         end
#         return false unless valid_line(row) && valid_line(col)
#     end
#     row = 0
#     while row < 9
#         col = 0
#         while col < 9
#             box = []
#             (row...(row + 3)).each do |y|
#                 (col...(col + 3)).each do |x|
#                     box << board[y][x]
#                 end
#             end
#             return false unless valid_line(box)
#             col += 3
#         end
#         row += 3
#     end
#     true
# end

# def valid_line(line)
#     count = Hash.new(0)
#     line.each { |el| count[el] += 1 unless el == '.' }
#     !count.values.any? { |amount| amount > 1}
# end

def valid_line(line)
  seen = {}
  line.each do |el|
    next if el == '.'
    return false if seen[el]

    seen[el] = true
  end

  true
end

def is_valid_sudoku(board)
  # Honestly, I prefer the swapped y/x method better, but this is clean.
  9.times do |index|
    row = board[index]
    col = board.map { |r| r[index] }
    return false unless valid_line(row) && valid_line(col)
  end

  [0, 3, 6].each do |dy|
    [0, 3, 6].each do |dx|
      box = []
      (dy...dy + 3).each do |y|
        (dx...dx + 3).each do |x|
          box << board[y][x]
        end
      end
      return false unless valid_line(box)
    end
  end

  true
end
