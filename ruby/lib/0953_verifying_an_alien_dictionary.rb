# frozen_string_literal: true

# Most idiomatic Ruby solution
# Arrays have spaceship operator for comparisons, but not < or >
def is_alien_sorted(words, order)
  order_map = order.each_char.with_index.to_h

  words.each_cons(2) do |word1, word2|
    w1_ranks = word1.chars.map { |c| order_map[c] }
    w2_ranks = word2.chars.map { |c| order_map[c] }
    return false if (w1_ranks <=> w2_ranks) == 1
  end

  true
end

# More idiomatic Ruby
def is_alien_sorted(words, order)
  map = order.each_char.with_index.to_h
  words.each_cons(2) { |word1, word2| return false unless compare(word1, word2, map) < 1 }
  true
end

def is_alien_sorted(words, order)
  map = {}
  order.each_char.with_index { |letter, idx| map[letter] = idx }
  (0...words.length - 1).each do |idx|
    return false unless compare(words[idx], words[idx + 1], map) < 1
  end
  true
end

def compare(word1, word2, map)
  return 0 if word1 == word2

  length = word1.length > word2.length ? word2.length : word1.length
  length.times do |idx|
    char1 = word1[idx]
    char2 = word2[idx]
    next if char1 == char2

    return map[char1] < map[char2] ? -1 : 1
  end
  word1.length > word2.length ? 1 : -1
end
