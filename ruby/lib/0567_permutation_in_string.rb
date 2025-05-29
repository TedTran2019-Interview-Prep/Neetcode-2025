# Fixed size sliding window logic, moving left pointer based on window size
def check_inclusion(s1, s2)
  s1_map = Hash.new(0)
  s1.each_char { |char| s1_map[char] += 1 }
  left = 0
  s2_map = Hash.new(0)
  s2.each_char.with_index do |right_char, right|
    s2_map[right_char] += 1

    while right - left + 1 > s1.length
      s2_map[s2[left]] -= 1
      s2_map.delete(s2[left]) if s2_map[s2[left]].zero?
      left += 1
    end

    return true if s2_map == s1_map
  end

  false
end

# Regular sliding window logic, moving left pointer based on count of characters in map
def check_inclusion(s1, s2)
  s1_map = Hash.new(0)
  s1.each_char { |char| s1_map[char] += 1 }
  left = 0
  s2_map = Hash.new(0)
  s2.each_char.with_index do |right_char, _right|
    s2_map[right_char] += 1
    return true if s2_map == s1_map

    while s2_map[right_char] > s1_map[right_char]
      s2_map[s2[left]] -= 1
      s2_map.delete(s2[left]) if s2_map[s2[left]].zero?
      left += 1
    end
  end

  false
end
