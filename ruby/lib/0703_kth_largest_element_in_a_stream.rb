# frozen_string_literal: true

class KthLargest
  def initialize(k, nums)
    @k = k
    @heap = create_heap(nums)
  end

  def add(val)
    @heap << val
    @heap.pop while @heap.size > @k
    @heap.peek
  end

  private

  def create_heap(nums)
    min_heap = Heap.new
    min_heap.heapify(nums)
    min_heap.pop while min_heap.size > @k
    min_heap
  end
end
