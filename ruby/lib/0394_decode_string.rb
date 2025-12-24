# frozen_string_literal: true

# Stack solution
def decode_string(s)
  stack = []
  s.each_char do |char|
    if char != ']'
      stack << char
      next
    end

    # Pop until '['
    content = []
    content << stack.pop until stack[-1] == '['
    stack.pop
    decoded_part = content.reverse.join
    # Pop until no more numbers
    nbr = []
    nbr << stack.pop while !stack.empty? && stack[-1].match?(/\d/)
    nbr = nbr.reverse.join.to_i
    # Nbr * content back into stack
    stack << decoded_part * nbr
  end
  stack.join
end

# Recursive solution
def decode_string(s)
  decode = lambda do |start_idx, repeat|
    decoded = []
    while start_idx < s.length && s[start_idx] != ']'
      if s[start_idx].match?(/\d/)
        nbr = 0
        until s[start_idx] == '['
          nbr *= 10
          nbr += s[start_idx].to_i
          start_idx += 1
        end
        start_idx += 1
        result, last_idx = decode.call(start_idx, nbr)
        decoded << result
        start_idx = last_idx + 1
      else
        decoded << s[start_idx]
        start_idx += 1
      end
    end
    [decoded.join * repeat, start_idx]
  end
  decode.call(0, 1)[0]
end
