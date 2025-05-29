def max_sliding_window(nums, k)
  dequeue = Containers::Deque.new
  left = 0
  maxes = []
  nums.each_with_index do |num, right|
    dequeue.pop_front if !dequeue.empty? && dequeue.front + k <= right

    dequeue.pop_back while !dequeue.empty? && num >= nums[dequeue.back]
    dequeue.push_back(right)

    maxes << nums[dequeue.front] if right >= k - 1
  end
  maxes
end
