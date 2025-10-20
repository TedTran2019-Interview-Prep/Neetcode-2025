# frozen_string_literal: true

def get_sum(a, b)
  mask = 0xffffffff
  until b.zero?
    carryover = (a & b) << 1
    a = (a ^ b) & mask
    b = carryover & mask
  end
  a = ~(a ^ mask) if a > (mask >> 1)
  a
end

# This works with fixed width two complement integers, but not with Ruby
def get_sum(a, b)
  while b != 0
    carry = a & b
    a ^= b
    b = carry << 1
  end
  a
end

# Naive, doesn't handle negatives
def get_sum(a, b)
  carryover = 0
  sum = 0
  (0..31).each do |bit_idx|
    a_bit = (a >> bit_idx) & 1
    b_bit = (b >> bit_idx) & 1
    new_a_bit = a_bit ^ carryover
    carryover = a_bit & carryover
    summed_bit = new_a_bit ^ b_bit
    carryover = new_a_bit & b_bit if carryover.zero?
    sum |= (1 << bit_idx) unless summed_bit.zero?
  end
  sum
end
