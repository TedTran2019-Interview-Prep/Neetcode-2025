# frozen_string_literal: true

# Monotonic stack solution
class StockSpanner
  def initialize
    @stack = []
  end

  def next(price)
    span = 1
    until @stack.empty?
      break if price < @stack[-1][0]

      span += @stack.pop[1]

    end
    @stack << [price, span]
    span
  end
end

# Naive, times out
class StockSpanner
  def initialize
    @stack = []
  end

  def next(price)
    span = 0
    @stack << price
    (@stack.length - 1).downto(0).each do |idx|
      break unless @stack[idx] <= price

      span += 1
    end
    span
  end
end
