# frozen_string_literal: true

def longest_palindrome(s)
  longest = ''
  s.each_char.with_index do |_char, index|
    left = index
    right = index
    while left >= 0 && right < s.length && s[left] == s[right]
      challenger = s[left..right]
      longest = challenger if challenger.length > longest.length
      left -= 1
      right += 1
    end

    left = index
    right = index + 1
    while left >= 0 && right < s.length && s[left] == s[right]
      challenger = s[left..right]
      longest = challenger if challenger.length > longest.length
      left -= 1
      right += 1
    end
  end
  longest
end
