# frozen_string_literal: true

def longest_common_subsequence(text1, text2)
  # +1 to make out of bounds == 0 easier
  dp = Array.new(text1.length + 1) { Array.new(text2.length + 1, 0) }
  (text1.length - 1).downto(0).each do |y|
    (text2.length - 1).downto(0).each do |x|
      if text1[y] == text2[x]
        diagonal = dp[y + 1][x + 1]
        dp[y][x] = 1 + diagonal
      else
        right = dp[y][x + 1]
        down = dp[y + 1][x]
        dp[y][x] = [right, down].max
      end
    end
  end
  dp[0][0]
end
