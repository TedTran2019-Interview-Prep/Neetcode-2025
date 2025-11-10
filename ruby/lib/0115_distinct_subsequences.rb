# frozen_string_literal: true

# Improved Memoized, passes all (converting hash to array)
def num_distinct(s, t)
  memo = Array.new(s.length) { Array.new(t.length, -1) }
  dfs = lambda do |s_idx, t_idx|
    return 1 if t_idx >= t.length
    return 0 if s_idx >= s.length
    return memo[s_idx][t_idx] unless memo[s_idx][t_idx].negative?

    subsequences = 0
    subsequences += dfs.call(s_idx + 1, t_idx + 1) if s[s_idx] == t[t_idx]
    subsequences += dfs.call(s_idx + 1, t_idx)
    memo[s_idx][t_idx] = subsequences
  end
  dfs.call(0, 0)
end

# Memoized, fails at 65/65
def num_distinct(s, t)
  memo = {}
  dfs = lambda do |s_idx, t_idx|
    return 1 if t_idx >= t.length
    return 0 if s_idx >= s.length

    key = [s_idx, t_idx]
    return memo[key] if memo.key?(key)

    subsequences = 0
    subsequences += dfs.call(s_idx + 1, t_idx + 1) if s[s_idx] == t[t_idx]
    subsequences += dfs.call(s_idx + 1, t_idx)
    memo[key] = subsequences
  end
  dfs.call(0, 0)
end

# Naive, fails at 52/66
def num_distinct(s, t)
  dfs = lambda do |s_idx, t_idx|
    return 1 if t_idx >= t.length
    return 0 if s_idx >= s.length

    subsequences = 0
    subsequences += dfs.call(s_idx + 1, t_idx + 1) if s[s_idx] == t[t_idx]
    subsequences += dfs.call(s_idx + 1, t_idx)
    subsequences
  end
  dfs.call(0, 0)
end
