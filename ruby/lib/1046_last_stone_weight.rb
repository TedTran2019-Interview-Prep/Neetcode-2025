# frozen_string_literal: true

def last_stone_weight(stones)
  max_heap = Heap.from_array(stones, :>)
  until max_heap.size <= 1
    y = max_heap.pop
    x = max_heap.pop
    max_heap << y - x unless y == x
  end
  max_heap.peek || 0
end
