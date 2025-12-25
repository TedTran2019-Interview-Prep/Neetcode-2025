# frozen_string_literal: true

def my_sqrt(x)
  left = 0
  right = x
  while left <= right
    middle = (left + right) / 2
    double = middle * middle
    if double == x
      return middle
    elsif double < x
      left = middle + 1
    else
      right = middle - 1
    end
  end
  right
end
