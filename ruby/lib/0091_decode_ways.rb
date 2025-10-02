# frozen_string_literal: true

# Memoized Solution
def num_decodings(s)
  dp = { s.length => 1 }
  dfs = lambda do |index|
    return dp[index] if dp[index]
    return 0 if s[index] == '0'

    # One step
    result = dfs.call(index + 1)

    # Two step
    if index + 1 < s.length &&
       (
       s[index] == '1' ||
       (s[index] == '2' && '0123456'.include?(s[index + 1]))
     )
      result += dfs.call(index + 2)
    end
    dp[index] = result
  end
  dfs.call(0)
end

# Naive solution
def num_decodings(s)
  numbers = (1..26).map(&:to_s).to_set
  decoded = Set.new
  stack = []
  dfs = lambda do |string|
    return if string.nil?

    if string.empty?
      decoded << stack.map { |nbr| (nbr.ord + 16).chr }.join
      return
    end

    # One step
    if numbers.include?(string[0])
      stack << string[0]
      dfs.call(string[1..])
      stack.pop
    end

    # Two step
    if numbers.include?(string[0..1])
      stack << string[0..1]
      dfs.call(string[2..])
      stack.pop
    end
  end
  dfs.call(s)
  decoded.length
end
