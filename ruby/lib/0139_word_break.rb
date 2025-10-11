# frozen_string_literal: true

# Bottom-up DP
def word_break(s, word_dict)
  dp = Array.new(s.length + 1, false)
  dp[s.length] = true
  (s.length - 1).downto(0).each do |start_index|
    word_dict.each do |word|
      next if word.length + start_index > s.length

      if compare_word(s, start_index, word)
        dp[start_index] = dp[start_index + word.length]
        break if dp[start_index]
      end
    end
  end
  dp[0]
end

# Memoized
def word_break(s, word_dict)
  memo = Array.new(s.length + 1)
  memo[s.length] = true
  dfs = lambda do |start_index|
    return memo[start_index] unless memo[start_index].nil?

    result = false
    word_dict.each do |word|
      next if word.length + start_index > s.length

      if compare_word(s, start_index, word)
        result = dfs.call(start_index + word.length)
        break if result
      end
    end
    memo[start_index] = result
  end
  dfs.call(0)
end

def compare_word(s, start_idx, word)
  word.each_char.with_index { |char, idx| return false unless char == s[idx + start_idx] }
  true
end
