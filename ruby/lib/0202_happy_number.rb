# frozen_string_literal: true

def is_happy(n)
  repeat = Set.new
  until n == 1
    return false if repeat.include?(n)

    repeat << n
    copy = n
    sum = 0
    until copy.zero?
      remainder = copy % 10
      copy /= 10
      sum += remainder**2
    end
    n = sum
  end
  true
end
