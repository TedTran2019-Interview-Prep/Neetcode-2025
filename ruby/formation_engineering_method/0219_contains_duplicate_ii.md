```ruby
=begin
Given array nums and integer k, true if two distinct indices such that
1. same number
2. i - j <= k
Aka same number that's <= k away
[1, 2, 3, 1]
LR. Move R forward 3
If there's more, move L forward (deleting that character), move R forward (adding that character)
If any instance of character >= 2, return true
False if go everything without any char being >= 2
=end
```
