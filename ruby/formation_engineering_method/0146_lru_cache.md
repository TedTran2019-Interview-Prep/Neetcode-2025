```ruby
# LRU cache (least recently used)
# capacity: maximum size of cache
# get (key), return value if exists, otherwise -1
# put (key, value)-- updates if exists, otherwise add, if it exceeds the capacity, evict LRU
# get and put must each run in O(1)

# Priority queue but based on time? But that wouldn't be O(1) insertion
# If we need O(1), it's probably going to involve hashmaps
# Linked list with pointers towards H/T
# With each node stored in k:v pairs in the hashmap
# Cases:
# get:
# - check hashmap for value, doesn't exist == -1
# - If exists, remove node and move to head of LL
# put:
# - If exists in hashmap, simply update value then move to head of LL
# - If doesn't exist in hashmap
#     - Add to hashmap
#     - move new node to head of LL
#     - if LL size > capacity, remove node at tail of LL
# Need to keep track of elements in LL

# Plan:
# create LL node (takes in value, next, prev)
# LRU cache class takes in capacity, has a length variable
#     - has head/tail dummy nodes
#         head.next = tail, tail.prev = head
#     - has a hashmap connecting key to node

# get:
#     check hashmap for value, -1 if doesn't exist
#     else, find node.... (need to know prev to remove and attach to head of list)

# put:
#     if exists, update through hashmap, remove frmo list, then attach to head
#     if doesn't exist
#         - create node
#         - add to head of list
#             - store head.next
#             - head.next = this node
#             - that node's next = old head.next
#         - remove node at tail
#             - tail.prev.prev's next = tail
#             - tail.prev = tail.prev.prev

# a (remove xyz node and move to head) action could be useful
```
