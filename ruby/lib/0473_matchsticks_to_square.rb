# frozen_string_literal: true

# Symmetry pruning pattern
def makesquare(matchsticks)
  quarter = matchsticks.sum.fdiv(4)
  return false unless quarter == quarter.truncate

  matchsticks.sort_by! { |length| -length }
  dfs = lambda do |sides, start_idx|
    return false if sides.any? { |side| side > quarter }
    return sides.all? { |side| side == quarter } if start_idx == matchsticks.length

    length = matchsticks[start_idx]
    used = Set.new
    sides.each_with_index do |side, side_idx|
      next if used.include?(side)

      sides[side_idx] += length
      used << side
      return true if dfs.call(sides, start_idx + 1)

      sides[side_idx] -= length
    end
    false
  end
  dfs.call([0, 0, 0, 0], 0)
end

# Fails on 189/195
def makesquare(matchsticks)
  quarter = matchsticks.sum.fdiv(4)
  return false unless quarter == quarter.truncate

  matchsticks.sort_by! { |length| -length }
  dfs = lambda do |top, left, right, bottom, start_idx|
    return false if top > quarter || left > quarter || right > quarter || bottom > quarter
    return top == left && left == right && right == bottom if start_idx >= matchsticks.length

    length = matchsticks[start_idx]
    return true if dfs.call(top + length, left, right, bottom, start_idx + 1)
    return true if dfs.call(top, left + length, right, bottom, start_idx + 1)
    return true if dfs.call(top, left, right + length, bottom, start_idx + 1)
    return true if dfs.call(top, left, right, bottom + length, start_idx + 1)

    false
  end
  dfs.call(0, 0, 0, 0, 0)
end
