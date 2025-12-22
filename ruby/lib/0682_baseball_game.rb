# frozen_string_literal: true

def cal_points(operations)
  stack = []
  operations.each do |operation|
    print stack
    case operation
    when '+'
      stack << stack[-1] + stack[-2]
    when 'D'
      stack << stack[-1] * 2
    when 'C'
      stack.pop
    else
      stack << operation.to_i
    end
  end
  stack.sum
end
