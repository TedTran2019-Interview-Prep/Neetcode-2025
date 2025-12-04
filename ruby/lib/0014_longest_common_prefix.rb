# frozen_string_literal: true

def longest_common_prefix(strs)
  prefix = []
  idx = 0
  while (char = strs.first[idx])
    strs.each { |str| return prefix.join unless str[idx] == char }
    prefix << char
    idx += 1
  end
  prefix.join
end

def longest_common_prefix(strs)
  prefix = []
  strs[0].length.times do |idx|
    match = strs[0][idx]
    (1...strs.length).each do |str_idx|
      str = strs[str_idx]
      char = str[idx]
      return prefix.join if char != match
    end
    prefix << match
  end
  prefix.join
end
