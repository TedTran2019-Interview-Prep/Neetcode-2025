# frozen_string_literal: true

def max_profit(prices)
  profit = 0
  (1...prices.length).each do |idx|
    profit += prices[idx] - prices[idx - 1] if prices[idx] > prices[idx - 1]
  end
  profit
end
