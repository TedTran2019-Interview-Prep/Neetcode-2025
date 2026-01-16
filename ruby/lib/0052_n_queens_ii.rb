# frozen_string_literal: true

def total_n_queens(n)
  cols = Set.new
  diags = Set.new
  inverted_diags = Set.new
  dfs = lambda do |queens_placed, row_idx|
    return (queens_placed == n ? 1 : 0) if row_idx == n

    result = 0
    n.times do |col_idx|
      diag = row_idx + col_idx
      inverted_diag = row_idx - col_idx
      next if cols.include?(col_idx) || diags.include?(diag) || inverted_diags.include?(inverted_diag)

      cols << col_idx
      diags << diag
      inverted_diags << inverted_diag
      result += dfs.call(queens_placed + 1, row_idx + 1)
      cols.delete(col_idx)
      diags.delete(diag)
      inverted_diags.delete(inverted_diag)
    end
    result
  end
  dfs.call(0, 0)
end
