```ruby
# prices array
# Choose a single day to buy/different day in FUTURE to sell
# Return maximum profit possible, otherwise 0
# Since days can only move forward...
# Lowest found so far, compare with all future values
# metaphorical window: lowest day so far is left pointer, current is right
# Plan:
# lowest = first element
# max_profit = 0
# iterate through prices
#     profit = price - lowest
#     max_profit = max of max profit and profit
#     lowest = min of price and lowest
# max profit
```
