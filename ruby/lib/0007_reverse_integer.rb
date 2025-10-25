# frozen_string_literal: true

def reverse(x)
  sign = 1
  max = 2**31 / 10
  reversed = 0
  if x.negative?
    x *= -1
    sign *= -1
  end
  until x < 10
    last_digit = x % 10
    x /= 10
    reversed = (reversed * 10) + last_digit
  end

  return 0 if reversed > max
  return 0 if reversed == max && ((sign == 1 && x > 7) || (sign == -1 && x > 8))

  ((reversed * 10) + x) * sign
end

def reverse(x)
  max = 2**31 - 1
  min = -2**31
  x_str = x.to_s
  sign = 1
  if x_str[0] == '-'
    sign = -1
    x_str = x_str[1..-1]
  end
  reversed = x_str.reverse.to_i * sign
  reversed > max || reversed < min ? 0 : reversed
end
