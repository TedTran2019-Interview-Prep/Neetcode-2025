# frozen_string_literal: true

def plus_one(digits)
  remainder = 1
  (digits.length - 1).downto(0).each do |idx|
    digits[idx] += remainder
    remainder = digits[idx] / 10
    digits[idx] %= 10
  end
  digits.unshift(remainder) unless remainder.zero?
  digits
end
