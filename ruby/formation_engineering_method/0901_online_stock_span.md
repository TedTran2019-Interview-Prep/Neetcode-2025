```ruby
=begin
Algo that collects daily price quotes for stock adn returns SPAN of stock's price for current day
span: max # of consecutive days (day and going backwards) for which the stock's price was <= to equal to price of that day
last 4 days: [7, 34, 1, 2], today: 8
span: 3 (1, 2, 8)
100, 80, 60, 70, 60, 75, 85
1, 1, 1, 2, 1, 4, 6

Naive: Given a number, look back and add everything <= val
Time limited exceeded

Better: How do I reduce repeat work?
Only want decreasing values in stack
100, 85
1, 1, 1, 2, 1, 4, 6
If you have a value greater than a value in stack, you take all of the values it's greater than.
=end
```
