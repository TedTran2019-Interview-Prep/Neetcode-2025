def length_of_longest_substring(s)
  left = 0
  count = Hash.new(0)
  max_length = 0
  s.length.times do |right|
    count[s[right]] += 1

    while count[s[right]] > 1
      count[s[left]] -= 1
      left += 1
    end

    length = (right - left) + 1
    max_length = [max_length, length].max
  end
  max_length
end
