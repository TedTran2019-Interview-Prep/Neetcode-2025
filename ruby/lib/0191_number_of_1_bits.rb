# frozen_string_literal: true

# Naive conversion solution
def hamming_weight(n)
  n.to_s(2).each_char.count { |char| char == '1' }
end

# Start from 32 bits and subtract solution
def hamming_weight(n)
  limit = 32
  count = 0
  until n.zero?
    fit = 2**limit
    if n >= fit
      n -= fit
      count += 1
    end
    limit -= 1
  end
  count
end

# Bitshift right by 1 at a time solution
def hamming_weight(n)
  result = 0
  until n.zero?
    result += 1 if n & 1 == 1
    n >>= 1
  end
  result
end

# Best approach that I won't come up with in the middle of an interview
def hamming_weight(n)
  result = 0
  until n.zero?
    n &= (n - 1)
    result += 1
  end
  result
end
