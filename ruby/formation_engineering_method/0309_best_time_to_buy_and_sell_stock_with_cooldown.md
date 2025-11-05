```ruby
=begin
prices, prices[i] is price of stock on ith day
find maximum profit that can be achieved
one transaction per day
after stock is sold, cannot be bought next day
cannot buy twice in a row
3 actions: buy, sell, do nothing

Naive:
Try out all possible actions for everything
1 -> Try buy, nothing
    2: Try sell, nothing
    ...
2 -> Buy, nothing...

Better:
Always have choice of buy/sell or cooldown
(Cooldown forced if after selling)
Do naive + caching
Cache by index + boolean
=end
```
