# frozen_string_literal: true

def count_substrings(s)
  palindromes = 0
  s.each_char.with_index do |_char, index|
    left = index
    right = index
    while left >= 0 && right < s.length && s[left] == s[right]
      palindromes += 1
      left -= 1
      right += 1
    end

    left = index
    right = index + 1
    while left >= 0 && right < s.length && s[left] == s[right]
      palindromes += 1
      left -= 1
      right += 1
    end
  end
  palindromes
end
