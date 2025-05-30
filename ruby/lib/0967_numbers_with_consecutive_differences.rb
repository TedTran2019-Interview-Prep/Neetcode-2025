def nums_same_consec_diff(n, k)
  stack = []
  results = []

  dfs = lambda do
    if stack.length > 1
      return if (stack[-1] - stack[-2]).abs != k

      if stack.length == n
        results << stack.join.to_i
        return
      end
    end

    10.times do |idx|
      next if stack.empty? && idx.zero?

      stack << idx
      dfs.call
      stack.pop
    end
  end

  dfs.call
  results
end

# Cleaner solution from ChatGPT utilizing numbers instead of an array
# Also optimized to only call on the next possible digits
def nums_same_consec_diff(n, k)
  results = []

  dfs = lambda do |num, length|
    if length == n
      results << num
      return
    end

    last_digit = num % 10
    next_digits = [last_digit + k, last_digit - k].uniq

    next_digits.each do |next_digit|
      next if next_digit < 0 || next_digit > 9

      dfs.call(num * 10 + next_digit, length + 1)
    end
  end

  (1..9).each { |i| dfs.call(i, 1) }
  results
end
