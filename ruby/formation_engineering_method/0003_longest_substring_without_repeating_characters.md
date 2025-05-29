```ruby
# Given string s, find length of longest substring w/o duplicates
# Start L, R at first char
# Add char to hashmap
# Move right forward as long as no duplicates, tracking length
# Move left forward until no duplicates again || left == right, removing char from hashmap
# Rinse and repeat
# Duplicate == that char has 2 of count
# When a 2 goes to 1, you know no duplicates!
```
