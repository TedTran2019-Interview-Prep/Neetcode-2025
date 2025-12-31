```ruby
=begin
head of singly linked list
integers left/right, left <= right
reverse nodes of list from left to position right

How to reverse regular linked list?
1 -> 2 -> 3 -> 4 -> 5
12345
Store 1->2 connection
Do 1-> prev passed in
Pass in 1
Go to 2, pass in 1.. repeat
Return 5 as head

Lesson: deal with simplest case first (there is a pre_left and post_right)
Dummy points at 12345
What is point of the dummy: no matter what, no nil checks to simplify logic
Pre-left, left, post_right
=end
```
