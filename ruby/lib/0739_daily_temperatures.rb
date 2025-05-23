def daily_temperatures(temperatures)
  stack = []
  days = Array.new(temperatures.length, 0)
  temperatures.each_with_index do |temperature, index|
    until stack.empty? || stack[-1][0] >= temperature
      former_index = stack.pop[1]
      days[former_index] = index - former_index
    end
    stack << [temperature, index]
  end
  days
end
