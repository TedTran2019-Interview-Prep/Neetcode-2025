# frozen_string_literal: true

def accounts_merge(accounts)
  graph = Hash.new { |h, k| h[k] = Set.new }
  accounts.each do |account|
    (1...account.length - 1).each do |idx|
      email_a = account[idx]
      email_b = account[idx + 1]
      graph[email_a] << email_b
      graph[email_b] << email_a
    end
  end

  visited = Set.new
  dfs = lambda do |email, all|
    return all unless email
    return all if visited.include?(email)

    visited << email
    all << email
    graph[email].each { |linked| dfs.call(linked, all) }
    all
  end

  answer = []
  accounts.each do |account|
    next if visited.include?(account[1])

    result = dfs.call(account[1], [])
    result.sort!
    result.unshift(account[0])
    answer << result
  end
  answer
end
