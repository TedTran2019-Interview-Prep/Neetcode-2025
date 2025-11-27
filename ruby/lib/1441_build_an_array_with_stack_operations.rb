# frozen_string_literal: true

def build_array(target, n)
  stack = []
  operations = []
  min_length = 0
  (1..n).each do |nbr|
    stack << nbr
    operations << 'Push'
    if stack == target
      break
    elsif stack[min_length] == target[min_length]
      min_length += 1
      next
    end

    stack.pop
    operations << 'Pop'
    break if stack == target
  end
  operations
end
