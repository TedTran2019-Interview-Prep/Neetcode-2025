# frozen_string_literal: true

def merge_alternately(word1, word2)
  merge_array = []
  one = 0
  two = 0
  while one < word1.length && two < word2.length
    merge_array << word1[one]
    merge_array << word2[two]
    one += 1
    two += 1
  end

  merge_array << word1[one..]
  merge_array << word2[two..]

  merge_array.join
end
