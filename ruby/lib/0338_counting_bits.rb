# frozen_string_literal: true

# DP Solution
def count_bits(n)
  dp = Array.new(n + 1, 0)
  offset = 1
  (1..n).each do |nbr|
    offset = nbr if offset * 2 == nbr
    dp[nbr] = 1 + dp[nbr - offset]
  end
  dp
end

# Naive
def count_bits(n)
  ans = Array.new(n + 1)
  (0..n).each { |nbr| ans[nbr] = count_ones(nbr) }
  ans
end

def count_ones(n)
  ones = 0
  until n.zero?
    n &= (n - 1)
    ones += 1
  end
  ones
end
