# Heap

## Implementation

- Start first element at index 1 to keep math simple
  - Left child at `2 * i`
  - Right child at `(2 * i) + 1`
  - Parent at `(i / 2) floored`
- Insert an element?
  - Add to last place
  - Heapify up
    - swap with parent while comparator is violated, that's it
- Pop an element
  - Store root node value
  - Place last value into 1st (then pop last)
  - swap with child that violates the heap rule
    - choose node that belongs higher up in tree as child (left vs right)
      - aka smaller child in min heap, bigger child in max heap
- Heapify given an array
  - Convert array into 1-based indexing by unshifting dummy element
  - From `(i / 2) floored` down to 1, call heapify down
