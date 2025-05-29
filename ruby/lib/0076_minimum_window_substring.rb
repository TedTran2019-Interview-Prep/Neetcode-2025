def min_window(s, t)
  t_map = Hash.new(0)
  t_total = 0
  t.each_char do |char|
    t_total += 1
    t_map[char] += 1
  end

  s_map = Hash.new(0)
  s_total = 0
  left = 0
  minimum_substring = ''
  minimum_length = Float::INFINITY

  s.each_char.with_index do |right_char, right|
    if t_map[right_char] > 0
      s_total += 1 if s_map[right_char] < t_map[right_char]
      s_map[right_char] += 1
    end

    while s_total == t_total
      left_char = s[left]
      if (right - left + 1) < minimum_length
        minimum_substring = s[left..right]
        minimum_length = right - left + 1
      end

      if t_map[left_char] > 0
        s_total -= 1 if s_map[left_char] <= t_map[left_char]
        s_map[left_char] -= 1
      end
      left += 1
    end
  end

  minimum_substring
end
