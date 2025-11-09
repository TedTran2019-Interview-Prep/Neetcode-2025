# frozen_string_literal: true

def min_distance(word1, word2)
  dp = Array.new(word1.length + 1) { Array.new(word2.length + 1, 0) }
  word2.length.times { |x| dp[word1.length][x] = word2.length - x }
  word1.length.times { |y| dp[y][word2.length] = word1.length - y }
  (word1.length - 1).downto(0).each do |y|
    (word2.length - 1).downto(0).each do |x|
      diagonal = dp[y + 1][x + 1]
      if word1[y] == word2[x]
        dp[y][x] = diagonal
      else
        right = dp[y][x + 1]
        down = dp[y + 1][x]
        dp[y][x] = 1 + [diagonal, right, down].min
      end
    end
  end
  dp[0][0]
end
