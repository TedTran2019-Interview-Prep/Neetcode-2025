# frozen_string_literal: true

def partition_labels(s)
  char_to_last_index = {}
  s.each_char.with_index { |char, idx| char_to_last_index[char] = idx }
  results = []
  size = 0
  partition_end = 0
  s.each_char.with_index do |char, idx|
    partition_end = [char_to_last_index[char], partition_end].max
    size += 1
    if idx == partition_end
      results << size
      size = 0
    end
  end
  results
end
