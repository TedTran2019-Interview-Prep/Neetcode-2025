# frozen_string_literal: true

def subarray_sum(nums, k)
  total = 0
  frequency = Hash.new(0)
  frequency[0] += 1
  prefix_sum = 0
  nums.each do |num|
    prefix_sum += num
    total += frequency[prefix_sum - k]
    frequency[prefix_sum] += 1
  end
  total
end

# Naive
def subarray_sum(nums, k)
  total = 0
  nums.each_with_index do |num, y|
    contiguous_sum = num
    total += 1 if contiguous_sum == k
    (y + 1...nums.length).each do |x|
      contiguous_sum += nums[x]
      total += 1 if contiguous_sum == k
    end
  end
  total
end
