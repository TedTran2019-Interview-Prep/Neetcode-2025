- No heap solution

```ruby
# To merge two linked lists is O(N)
# Think about merge sort, given: 1 4 5, 1 3 4, 2 6
# Merge: L1, L2. Then merge L2, newly generated L3
# Basically if 100 lists -> 50 -> 25... and so on
# N * logk number of operations
# N = number elements, K = number lists
# Essentially just think of merge sort!

# Plan:
# until lists.length is 1
#     new_list = []
#     l1 = lists[index]
#     l2 = lists[index + 1]
#     merge_list merge(l1, l2)
#     new_list << merged_list
#     lists = new_list
# return list.first

# function merge(l1, l2)
#     dummy node
#     curr = dummy
#     while l1 && l2
#         if l1 > l2
#             curr.next = l1
#             curr = curr.next
#             l1 = l1.next
#         else
#             curr.next = l2
#             curr = curr.next
#             l2 = l2.next

#     current.next = l1
#     current.next = l2
#     dummy.next
```

- For the heap solution, watch out when moving the list forward.
  - Make sure to move the actual list forward, not just a copy.

```ruby
# an array of K sorted linked-lists, need to merge all of them in ascending order as one linked list
# Similar to merge K sorted arrays
# Utilize a heap data structure, where each heap is by minimum, storing [value node index]

# Go through the array, for each LL: put each first node value into the heap, storing [value node index], move forward one
# Make a dummy head node
# current = dummy
# Until the heap is empty
#     value node index = heap.pop
#     current.next = node
#     current = current.next
#     if array[index] isn't nil, add that node to the heap and continue onwards
# return dummy.next
```
