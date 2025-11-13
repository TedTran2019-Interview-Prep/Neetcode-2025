# frozen_string_literal: true

# Memoized
def is_match(s, p)
  memo = {}
  dfs = lambda do |s_idx, p_idx|
    return true if s_idx >= s.length && p_idx >= p.length
    return false if p_idx >= p.length

    key = [s_idx, p_idx]
    return memo[key] if memo.key?(key)

    match = s_idx < s.length && (s[s_idx] == p[p_idx] || p[p_idx] == '.')
    memo[key] = if p[p_idx + 1] == '*'
                  use_star = false
                  use_star = dfs.call(s_idx + 1, p_idx) if match
                  dont_use_star = dfs.call(s_idx, p_idx + 2)
                  dont_use_star || use_star
                elsif match
                  dfs.call(s_idx + 1, p_idx + 1)
                else
                  false
                end
  end
  dfs.call(0, 0)
end

# Naive
def is_match(s, p)
  dfs = lambda do |s_idx, p_idx|
    return true if s_idx >= s.length && p_idx >= p.length
    return false if p_idx >= p.length

    match = s_idx < s.length && (s[s_idx] == p[p_idx] || p[p_idx] == '.')
    if p[p_idx + 1] == '*'
      dont_use_star = false
      use_star = dfs.call(s_idx, p_idx + 2)
      dont_use_star = dfs.call(s_idx + 1, p_idx) if match
      dont_use_star || use_star
    elsif match
      dfs.call(s_idx + 1, p_idx + 1)
    else
      false
    end
  end
  dfs.call(0, 0)
end
