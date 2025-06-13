# frozen_string_literal: true

def least_interval(tasks, n)
  count = tasks.tally
  max_heap = Heap.from_array(count.values, :>)
  time = 0
  queue = []

  until max_heap.empty? && queue.empty?
    time += 1
    unless max_heap.empty?
      task = max_heap.pop - 1
      queue << [task, time + n] unless task.zero?
    end

    max_heap << queue.shift[0] if !queue.empty? && (queue[0][1] == time)
  end

  time
end
