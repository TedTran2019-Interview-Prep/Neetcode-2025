```ruby
=begin
one entrance: root
each house only has 1 parent house
all houses form a binary tree: contact police if 2 directly linked houses are broken into on the same night
maximum amount of money thief can rob without alerting police
If you take a node, can't take its direct children
If you don't a node, you can take it's children
Combine maximum of left/right at the end, return result
You can either take current or skip (or be force skipped)
skip = true == force skip
else can take or skip
take is adding node val to left + right result

Even though my way is fine, let's try NC's way to learn that technique
it's much harder to reason about, but the code is much cleaner
=end
```
