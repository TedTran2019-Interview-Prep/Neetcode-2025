# frozen_string_literal: true

# Better combinatoric formulas
def count_trapezoids(points)
  count = Hash.new(0)
  points.each { |_x, y| count[y] += 1 }
  ways = []
  count.each_value do |value|
    next if value < 2

    ways << value * (value - 1) / 2
  end

  modulo = 10**9 + 7
  sum = 0
  combinations = 0
  ways.each do |way|
    combinations += sum * way
    sum += way
  end
  combinations % modulo
end

# Unoptimal math formulas
def count_trapezoids(points)
  count = Hash.new(0)
  points.each { |x, y| count[y] += 1 }
  values = []
  cache = { 2 => 1 }
  count.each do |_key, value|
    next if value < 2

    if cache.key?(value)
      values << cache[value]
      next
    end

    cache[value] = factorial(value) / (2 * factorial(value - 2))
    values << cache[value]
  end

  return 0 if values.length <= 1

  modulo = 10**9 + 7
  combinations = 0
  (0...values.length - 1).each do |y|
    nbr1 = values[y]
    (y + 1...values.length).each do |x|
      nbr2 = values[x]
      combinations += (nbr1 * nbr2)
    end
  end
  combinations % modulo
end

def factorial(number)
  (1..number).inject { |accu, num| accu * num }
end
