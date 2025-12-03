# frozen_string_literal: true

def remove_duplicate_letters(s)
  last_occurrence = {}
  s.each_char.with_index { |char, idx| last_occurrence[char] = idx }
  stack = []
  in_stack = Set.new
  s.each_char.with_index do |char, idx|
    next if in_stack.include?(char)

    in_stack.delete(stack.pop) while !stack.empty? && stack[-1] > char && last_occurrence[stack[-1]] > idx

    stack << char
    in_stack << char
  end
  stack.join
end
