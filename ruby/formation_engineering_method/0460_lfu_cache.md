```ruby
=begin
Least frequently used cache
- Least hits = purge after xyz time
capacity
get(key): value or -1
put(key, value): update if present, insert if not present
IF at capacity, invalidate/remove, if tie, do least recently used
get/put must run in O(1) average time complexity
So let's yolo with space

Remember that every time a key is accessed, it's +1 to counter
Meaning updates and gets +1, insert sets to 1

Hashmap[key] -> gives value
How do we remove keys that are the least frequently accessed? (Least recently used if tie)
hashmap[key] -> occurrences
Hashmap -> Linked List (Can use arraylist to simplify since O(1) shift)
Hashmap[occurrence] -> [keys]
Problem: means you have to find key in hashmap[occurrence] and add it to next tier
Meaning O(N) search..
To deal with this, use linked lists instead of arrays, so you can have O(1) deletion w/o search by
using a map to point to nodes
=end
```
