# frozen_string_literal: true

def guessNumber(n)
  left = 1
  right = n
  while left <= right
    middle = (left + right) / 2
    if guess(middle).zero?
      return middle
    elsif guess(middle).negative?
      right = middle - 1
    else
      left = middle + 1
    end
  end
end
