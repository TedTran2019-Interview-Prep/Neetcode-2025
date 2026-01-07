# frozen_string_literal: true

def longest_diverse_string(a, b, c)
  max_heap = Heap.new { |a, b| a[1] > b[1] } # [char, count]
  max_heap << ['a', a] unless a.zero?
  max_heap << ['b', b] unless b.zero?
  max_heap << ['c', c] unless c.zero?
  happy_str = []
  until max_heap.empty?
    char, occurrences = max_heap.pop
    if happy_str[-1] == happy_str[-2] && char == happy_str[-2]
      break if max_heap.empty?

      char_two, occurrences_two = max_heap.pop
      occurrences_two -= 1
      happy_str << char_two
      max_heap << [char_two, occurrences_two] unless occurrences_two.zero?
    else
      happy_str << char
      occurrences -= 1
    end
    max_heap << [char, occurrences] unless occurrences.zero?
  end
  happy_str.join
end
