# frozen_string_literal: true

def word_break(s, word_dict)
  results = []
  word_dict = word_dict.to_set
  dfs = lambda do |words_array, start_index|
    if start_index == s.length
      results << words_array.join(' ')
      return
    end

    str = ''
    (start_index...s.length).each do |idx|
      str << s[idx]
      # Starting a new word
      next unless word_dict.include?(str)

      words_array << str
      dfs.call(words_array, idx + 1)
      words_array.pop
    end
  end
  dfs.call([], 0)
  results
end
