# frozen_string_literal: true

def get_order(tasks)
  # enqueue, processing, index
  tasks.each_with_index { |task, idx| task << idx }
  tasks.sort! { |a, b| a[0] <=> b[0] }
  min_heap = Heap.new { |a, b| a[1] == b[1] ? a[2] < b[2] : a[1] < b[1] }
  order = []
  time = 0
  until tasks.empty? && min_heap.empty?
    min_heap << tasks.shift while !tasks.empty? && tasks[0][0] <= time
    if !min_heap.empty?
      _enqueue, processing, index = min_heap.pop
      order << index
      time += processing
    else
      time = tasks[0][0]
    end
  end
  order
end
