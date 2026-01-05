# frozen_string_literal: true

def construct(grid)
  return nil if grid.nil? || grid.empty?

  # Start y, start x, end y, end x
  dfs = lambda do |sy, sx, ey, ex|
    one_count = 0
    zero_count = 0
    (sy...ey).each do |y|
      (sx...ex).each do |x|
        grid[y][x] == 1 ? one_count += 1 : zero_count += 1
      end
    end

    if one_count.positive? && zero_count.positive?
      Node.new(false, false,
               dfs.call(sy, sx, (sy + ey) / 2, (sx + ex) / 2), # top left
               dfs.call(sy, (sx + ex) / 2, (sy + ey) / 2, ex), # top right
               dfs.call((sy + ey) / 2, sx, ey, (sx + ex) / 2), # bottom left
               dfs.call((sy + ey) / 2, (sx + ex) / 2, ey, ex)) # bottom right
    elsif one_count.positive?
      Node.new(true, true)
    elsif zero_count.positive?
      Node.new(false, true)
    end
  end
  dfs.call(0, 0, grid.length, grid[0].length)
end
