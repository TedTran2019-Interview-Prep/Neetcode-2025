# frozen_string_literal: true

def find_kth_largest(nums, k)
  heap = Heap.from_array(nums, :>)
  (k - 1).times { heap.pop }
  heap.peek
end

# Quick Select Solution
def find_kth_largest(nums, k)
  k = nums.length - k
  quick_select = lambda do |left, right|
    pivot = nums[right]
    partition = left
    (left...right).each do |l|
      if nums[l] <= pivot
        nums[l], nums[partition] = nums[partition], nums[l]
        partition += 1
      end
    end
    nums[right], nums[partition] = nums[partition], nums[right]
    if partition == k
      nums[partition]
    elsif partition > k
      quick_select.call(left, partition - 1)
    else
      quick_select.call(partition + 1, right)
    end
  end
  quick_select.call(0, nums.length - 1)
end
