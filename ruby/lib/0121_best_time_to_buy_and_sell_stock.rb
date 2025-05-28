def max_profit(prices)
  lowest = prices.first
  max_profit = 0
  prices.each do |price|
    profit = price - lowest
    max_profit = [max_profit, profit].max
    lowest = [price, lowest].min
  end
  max_profit
end
