# frozen_string_literal: true

# Cleaner using heapify and prev variable
# Heap empty + no prev held == done!
def reorganize_string(s)
  count = Hash.new(0)
  s.each_char { |char| count[char] += 1 }
  max_heap = Heap.new { |a, b| a[1] > b[1] }
  max_heap.heapify(count.to_a)
  new_str = []
  prev = nil
  until max_heap.empty?
    char, occurrence = max_heap.pop
    new_str << char
    occurrence -= 1
    max_heap << prev if prev
    prev = occurrence.zero? ? nil : [char, occurrence]
  end
  prev.nil? ? new_str.join : ''
end

def reorganize_string(s)
  count = Hash.new(0)
  s.each_char { |char| count[char] += 1 }
  max_heap = Heap.new { |a, b| a[1] > b[1] } # [char, count]
  count.each { |char, occ| max_heap << [char, occ] }
  new_str = []
  until max_heap.empty?
    char_one, count_one = max_heap.pop
    if char_one == new_str[-1]
      return '' if max_heap.empty?

      char_two, count_two = max_heap.pop
      new_str << char_two
      count_two -= 1
      max_heap << [char_two, count_two] unless count_two.zero?
      max_heap << [char_one, count_one]
    else
      new_str << char_one
      count_one -= 1
      max_heap << [char_one, count_one] unless count_one.zero?
    end
  end
  new_str.join
end
