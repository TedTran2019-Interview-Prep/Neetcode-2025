# frozen_string_literal: true

def final_prices(prices)
  answer = prices.dup
  stack = []
  prices.each_with_index do |price, idx|
    while !stack.empty? && price <= stack[-1][0]
      prev_price, prev_idx = stack.pop
      answer[prev_idx] = prev_price - price
    end
    stack << [price, idx]
  end
  answer
end

# Naive
def final_prices(prices)
  answer = Array.new(prices.length)
  prices.each_with_index do |price, y|
    (y + 1...prices.length).each do |x|
      if prices[x] <= price
        answer[y] = price - prices[x]
        break
      end
    end
    answer[y] = price if answer[y].nil?
  end
  answer
end
