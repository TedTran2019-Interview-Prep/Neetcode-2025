# frozen_string_literal: true

# "DFS" solution
class WordDictionary
  def initialize
    @trie = {}
    @trie[:word] = false
  end

  def add_word(word)
    current = @trie
    word.each_char do |char|
      current[char] ||= {}
      current = current[char]
    end
    current[:word] = true
  end

  def search(word)
    dfs = lambda do |start, trie|
      (start...word.length).each do |index|
        char = word[index]
        if char == '.'
          trie.each_key do |key|
            next if key == :word
            return true if dfs.call(index + 1, trie[key])
          end

          return false
        else
          return false unless trie[char]

          trie = trie[char]
        end
      end
      trie[:word] == true
    end
    dfs.call(0, @trie)
  end
end

# "BFS" solution
class WordDictionary
  def initialize
    @trie = {}
    @trie[:word] = false
  end

  def add_word(word)
    current = @trie
    word.each_char do |char|
      unless current[char]

        current[char] = {}
        current['.'] ||= []
        current['.'] << current[char]
      end
      current = current[char]
    end
    current[:word] = true
  end

  def search(word)
    word_maps = [@trie]
    word.each_char do |char|
      new_maps = []
      word_maps.each do |map|
        if map[char].is_a? Array
          new_maps.concat(map[char])
        elsif map[char]
          new_maps << map[char]
        end
      end
      word_maps = new_maps
    end
    word_maps.any? { |map| map[:word] == true }
  end
end
