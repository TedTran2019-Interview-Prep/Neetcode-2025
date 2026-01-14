# frozen_string_literal: true

def combine(n, k)
  combinations = []
  dfs = lambda do |subset, nbr|
    if subset.length == k
      combinations << subset.dup
      return
    end

    (nbr..n).each do |start_nbr|
      subset << start_nbr
      dfs.call(subset, start_nbr + 1)
      subset.pop
    end
  end
  dfs.call([], 1)
  combinations
end
