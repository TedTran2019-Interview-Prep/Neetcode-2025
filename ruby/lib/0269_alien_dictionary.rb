# frozen_string_literal: true

# Lintcode working solution since I don't have Leetcode premium
def alien_order(words)
  graph = Hash.new { |h, k| h[k] = Set.new }
  words.each { |word| word.each_char { |char| graph[char] } }

  (0...words.length - 1).each do |index|
    word1 = words[index]
    word2 = words[index + 1]
    min_length = [word1.length, word2.length].min
    return '' if word1.length > word2.length && word1.start_with?(word2)

    (0...min_length).each do |j|
      next unless word1[j] != word2[j]

      graph[word1[j]] << word2[j]
      break
    end
  end

  visit = {} # false = visited, true = current path
  result = []
  dfs = lambda do |char|
    return visit[char] if visit.key?(char)

    visit[char] = true
    graph[char].each do |neighbor|
      return true if dfs.call(neighbor)
    end
    visit[char] = false
    result << char
    false
  end
  # graph.each_key { |key| return '' if dfs.call(key) }
  graph.keys.sort.reverse.each { |key| return '' if dfs.call(key) }
  result.reverse.join
end
