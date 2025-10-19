# frozen_string_literal: true

def reverse_bits(n)
  n.to_s(2).rjust(32, '0').reverse.to_i(2)
end

def reverse_bits(n)
  reversed_bits = 0
  31.downto(0) do |nbr|
    # Gets the bit in n starting from lowest (1001), grabs the last 1
    original_bit = (n >> (31 - nbr)) & 1
    # If it's 1 and nbr is 5, creates 100000
    insert = original_bit << nbr
    # Does the OR operation to set insert into reversed bits without changing values
    reversed_bits |= insert
  end
  reversed_bits
end
