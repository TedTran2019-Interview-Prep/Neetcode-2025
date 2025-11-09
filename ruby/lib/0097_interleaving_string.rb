# frozen_string_literal: true

# Bottom-up DP
def is_interleave(s1, s2, s3)
  return false if s1.length + s2.length != s3.length

  dp = Array.new(s1.length + 1) { Array.new(s2.length + 1, false) }
  dp[s1.length][s2.length] = true
  s1.length.downto(0).each do |idx1|
    s2.length.downto(0).each do |idx2|
      dp[idx1][idx2] = true if idx1 < s1.length && s1[idx1] == s3[idx1 + idx2] && dp[idx1 + 1][idx2]
      dp[idx1][idx2] = true if idx2 < s2.length && s2[idx2] == s3[idx1 + idx2] && dp[idx1][idx2 + 1]
    end
  end
  dp[0][0]
end

# Memoized solution
def is_interleave(s1, s2, s3)
  return false if s1.length + s2.length != s3.length

  memo = {}
  dfs = lambda do |idx1, idx2|
    return true if idx1 + idx2 >= s3.length

    key = [idx1, idx2]
    return memo[key] if memo.key?(key)

    result1 = (dfs.call(idx1 + 1, idx2) if s1[idx1] == s3[idx1 + idx2]) || false
    result2 = (dfs.call(idx1, idx2 + 1) if s2[idx2] == s3[idx1 + idx2]) || false
    memo[key] = result1 || result2
  end
  dfs.call(0, 0)
end

# Improved Naive
def is_interleave(s1, s2, s3)
  return false if s1.length + s2.length != s3.length

  dfs = lambda do |idx1, idx2|
    return true if idx1 + idx2 >= s3.length

    result1 = (dfs.call(idx1 + 1, idx2) if s1[idx1] == s3[idx1 + idx2]) || false
    result2 = (dfs.call(idx1, idx2 + 1) if s2[idx2] == s3[idx1 + idx2]) || false
    result1 || result2
  end
  dfs.call(0, 0)
end

# Naive
def is_interleave(s1, s2, s3)
  return true if s3.empty?
  return true if (s1 == s3 || s2 == s3) && (s1.empty? || s2.empty?)

  interleaved_array = []
  dfs = lambda do |idx1, idx2|
    return true if interleaved_array.length == s3.length &&
                   !(idx1.zero? || idx2.zero?) &&
                   interleaved_array.join == s3

    result1 = false
    result2 = false
    if idx1 < s1.length
      interleaved_array << s1[idx1]
      result1 = dfs.call(idx1 + 1, idx2)
      interleaved_array.pop
    end
    if idx2 < s2.length
      interleaved_array << s2[idx2]
      result2 = dfs.call(idx1, idx2 + 1)
      interleaved_array.pop
    end
    result1 || result2
  end
  dfs.call(0, 0)
end
