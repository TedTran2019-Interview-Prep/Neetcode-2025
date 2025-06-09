# frozen_string_literal: true

# Ruby is too slow-- this solution times out even though the translated C++/Java variants work
def find_words(board, words)
  trie = TrieNode.new
  words.each { |word| trie.insert(word) }
  dirs = [[1, 0], [-1, 0], [0, 1], [0, -1]].freeze
  word = []
  words_found = Set.new

  dfs = lambda do |row, col, trie_node, visited|
    if trie_node.is_word
      words_found << word.join
      trie_node.is_word = false # Avoids re-joining work
    end

    return if trie_node.children.empty?

    dirs.each do |dir|
      dy, dx = dir
      new_row = dy + row
      new_col = dx + col
      next if new_row < 0 || new_col < 0 || new_row >= board.length || new_col >= board[0].length
      next if visited.include? [new_row, new_col]

      char = board[new_row][new_col]
      next unless trie_node[char]

      word << char
      visited << [new_row, new_col]
      dfs.call(new_row, new_col, trie_node[char], visited)
      visited.delete([new_row, new_col])
      word.pop
    end
  end

  board.length.times do |row|
    board[row].length.times do |col|
      char = board[row][col]
      next unless trie[char]

      word << char
      visited = Set.new
      visited << [row, col]
      dfs.call(row, col, trie[char], visited)
      word.pop
    end
  end
  words_found.to_a
end

class TrieNode
  attr_accessor :children, :is_word

  def initialize
    @children = {}
    @is_word = false
  end

  def []=(key, value)
    @children[key] = value
  end

  def [](key)
    @children[key]
  end

  def insert(word)
    current = self
    word.each_char do |char|
      current[char] ||= TrieNode.new
      current = current[char]
    end
    current.is_word = true
  end
end
