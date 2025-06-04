def matrix_multiply(a, b)
  b_t = b.transpose

  a.map do |row|
    b_t.map do |col|
      row.zip(col).map { |x, y| x * y }.sum
    end
  end
end

def matrix_multiply(a, b)
  new_matrix = []

  a.length.times do |row|
    new_row = []
    b[0].length.times do |col|
      a_row = a[row]
      sum = 0
      a_row.length.times do |idx|
        sum += a[row][idx] * b[idx][col]
      end
      new_row << sum
    end
    new_matrix << new_row
  end

  new_matrix
end
