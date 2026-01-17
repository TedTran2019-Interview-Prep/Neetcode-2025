# frozen_string_literal: true

# Optimized memoized backtracking solution utilizing a trie
def min_extra_char(s, dictionary)
  trie = Trie.new
  dictionary.each { |word| trie.insert(word) }
  memo = {}
  dfs = lambda do |start_idx|
    return 0 if start_idx == s.length
    return memo[start_idx] if memo.key?(start_idx)

    # Skip
    extra = 1 + dfs.call(start_idx + 1)
    curr = trie.trie
    # Take characters up til' idx + 1 every time there's a match and see if it's better
    (start_idx...s.length).each do |idx|
      letter = s[idx]
      break unless curr[letter]

      curr = curr[letter]
      if curr[:word]
        branch_extra = dfs.call(idx + 1)
        extra = [branch_extra, extra].min
      end
    end
    memo[start_idx] = extra
  end
  dfs.call(0)
end

class Trie
  attr_reader :trie

  def initialize
    @trie = {}
  end

  def insert(word)
    curr = @trie
    word.each_char do |char|
      curr[char] ||= {}
      curr = curr[char]
    end
    curr[:word] = true
  end
end

# Memoized backtracking solution
def min_extra_char(s, dictionary)
  dictionary = dictionary.to_set
  memo = {}
  dfs = lambda do |start_idx|
    return 0 if start_idx == s.length
    return memo[start_idx] if memo.key?(start_idx)

    # Skip
    extra = 1 + dfs.call(start_idx + 1)
    word = ''
    # Take characters up til' idx + 1 every time there's a match and see if it's better
    (start_idx...s.length).each do |idx|
      word << s[idx]
      if dictionary.include?(word)
        branch_extra = dfs.call(idx + 1)
        extra = [branch_extra, extra].min
      end
    end
    memo[start_idx] = extra
  end
  dfs.call(0)
end

# This solution doesn't work, fails on 290/2028 with wrong answer.
# It doesn't consider the case where you may want to skip even on a valid prefix.
def min_extra_char(s, dictionary)
  trie = Trie.new
  dictionary.each { |word| trie.insert(word) }
  dictionary = dictionary.to_set

  dfs = lambda do |start_idx|
    word = ''
    extra = 0
    min_extra = Float::INFINITY
    (start_idx...s.length).each do |idx|
      word << s[idx]
      unless trie.prefix?(word)
        extra += word.length
        word = ''
        next
      end

      if dictionary.include?(word)
        branch_extra = dfs.call(idx + 1) + extra
        min_extra = branch_extra if branch_extra < min_extra
      end
    end
    [min_extra, extra].min
  end
  dfs.call(0)
end
