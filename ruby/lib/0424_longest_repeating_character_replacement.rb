# Solution utilizing max freq
def character_replacement(s, k)
  left = 0
  max_length = 0
  max_freq = 0
  counts = Hash.new(0)
  s.each_char.with_index do |right_char, right|
    counts[right_char] += 1
    max_freq = [counts[right_char], max_freq].max

    while (right - left + 1) - max_freq > k
      counts[s[left]] -= 1
      left += 1
    end

    length = (right - left) + 1
    max_length = [max_length, length].max
  end

  max_length
end

# O(26) hashmap check on window resizing
def character_replacement(s, k)
  left = 0
  max_length = 0
  counts = Hash.new(0)
  max_window_char = s[0]
  s.each_char.with_index do |right_char, right|
    counts[right_char] += 1
    max_window_char = right_char if counts[right_char] > counts[max_window_char]

    while (right - left + 1) - counts[max_window_char] > k
      counts[s[left]] -= 1
      left += 1
      counts.each do |k, v|
        max_window_char = k if v > counts[max_window_char]
      end
    end

    length = (right - left) + 1
    max_length = [max_length, length].max
  end

  max_length
end
