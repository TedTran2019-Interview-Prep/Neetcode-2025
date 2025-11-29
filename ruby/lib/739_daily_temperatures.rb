# frozen_string_literal: true

def daily_temperatures(temperatures)
  stack = []
  answer = Array.new(temperatures.length, 0)
  temperatures.each_with_index do |temp, idx|
    while !stack.empty? && temp > stack[-1][0]
      _prev_temp, prev_idx = stack.pop
      answer[prev_idx] = idx - prev_idx
    end
    stack << [temp, idx]
  end
  answer
end
