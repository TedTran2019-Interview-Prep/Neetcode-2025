```ruby
=begin
trib(0) = 0
trib(1) = 1
trib(2) = 1
trib(3) = 2
trib(4) = 4
Basically just add previous three numbers
Can do this recursively or through DP
Recursive is just trib(n - 1) + trib(n - 2) + trib(n - 3) and cache values
Or you can have [0, 1, 1] then add the next and repeat...
=end
```
