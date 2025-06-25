```ruby
=begin
Finds median from a data stream
[2, 3, 4] = Median is 3
[2, 3] = Median is 2.5 (mean between two middle values)

addNum (adds number from data stream to data structure)
findMedian (returns median of all elements so far)

How to be efficient? This reminds me of the median of two sorted arrays
We need to find the greatest of the smaller half, minimum of the greater half
[2] [3], always add new value to greater half... then grab SMALLEST of greater half
We want: GREATEST of smaller half, SMALLEST of bigger half
Check where new value belongs
If it's less than left's top, it belongs in left
If it's greater or equal to left's top, it belongs in right
Rebalance the heaps so that the length of right heap is always EQUALS or +1 of left heap
Actually, only need to rebalance when findMedian is called
Sorting is nlogn every time, this method is klogn, where 2 * k is the number of elements added since

So left would use a max heap
Right would use a min heap
If the value is less than left's top, put in left
Else put it in right
If empty, always put it in the empty one first (but check right first)

For findMedian, balance the heaps first
If it's even, top of left + top of right / 2
If it's odd, just the top of right

How to balance?
Check if right is greater than left or vice versa
Remove elements from one to add to the other
=end
```
