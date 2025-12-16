```ruby
=begin
prices[i] is price of a given stock on ith day
Maximum profit that can be achieved
Can buy, wait another day, sell-buy
Can you just sell the stock the moment you see a higher stock?
7, 1, 5...
+4, pop 1, add 5
7, 5, 3, 6
+3, pop 3, add 6
7, 5, 6, 4
Just add every increase of stock price
Actually, you can just subtract previous, don't even need a stack
=end
```
