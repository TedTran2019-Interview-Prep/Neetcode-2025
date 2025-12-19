# frozen_string_literal: true

def valid_palindrome(s)
  valid(s, 0, s.length - 1, 0)
end

def valid(s, left, right, deleted)
  while left < right
    return false if s[left] != s[right] && deleted == 1

    if s[left] != s[right]
      left_attempt = valid(s, left + 1, right, deleted + 1)
      right_attempt = valid(s, left, right - 1, deleted + 1)
      return left_attempt || right_attempt
    else
      left += 1
      right -= 1
    end
  end
  true
end
