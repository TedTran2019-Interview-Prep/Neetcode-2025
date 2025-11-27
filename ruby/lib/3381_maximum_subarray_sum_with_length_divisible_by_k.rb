# frozen_string_literal: true

def max_subarray_sum(nums, k)
  max = -Float::INFINITY
  min_prefix_sums = Array.new(k, Float::INFINITY)
  # Create prefix sums array
  prefix_sums = Array.new(nums.length, 0)
  total = 0
  nums.each_with_index do |num, idx|
    total += num
    prefix_sums[idx] = total
  end
  prefix_sums.unshift(0)

  prefix_sums.each_with_index do |prefix_sum, idx|
    min_idx = idx % k
    max = [prefix_sum - min_prefix_sums[min_idx], max].max
    min_prefix_sums[min_idx] = [min_prefix_sums[min_idx], prefix_sum].min
  end
  max
end

# Naive, N^2
def max_subarray_sum(nums, k)
  max = -Float::INFINITY
  nums.each_with_index do |num, y|
    total = 0
    length = 0
    (y...nums.length).each do |x|
      total += nums[x]
      length += 1
      max = [max, total].max if (length % k).zero?
    end
  end
  max
end
