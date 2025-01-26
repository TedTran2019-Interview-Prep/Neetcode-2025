# frozen_string_literal: true

# @param {String} s
# @param {String} t
# @return {Boolean}
# s and t consist of lowercase English letters.
def is_anagram(s, t)
  return false unless s.length == t.length

  count = Array.new(26, 0)
  s.each_char.with_index do |char, idx|
    count[char.ord - 'a'.ord] += 1
    count[t[idx].ord - 'a'.ord] -= 1
  end
  count.all?(&:zero?)
end

# Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?
# Use a hash instead of an array.
