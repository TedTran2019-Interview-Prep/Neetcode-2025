# frozen_string_literal: true

def four_sum(nums, target)
  nums.sort!
  sums = []
  left = 0
  right = nums.length - 1
  while left < right
    outer_val = nums[left]
    results = three_sum(nums, left + 1, target - nums[left])
    results.each { |result| sums << [outer_val] + result }
    left += 1
    left += 1 while nums[left] == nums[left - 1]
  end
  sums
end

# Find all valid three_sums from this point
def three_sum(nums, left, target)
  sums = []
  right = nums.length - 1
  while left < right
    outer_val = nums[left]
    results = two_sum(nums, left + 1, target - nums[left])
    results.each { |result| sums << [outer_val] + result }
    left += 1
    left += 1 while nums[left] == nums[left - 1]
  end
  sums
end

# Find all valid two_sums from this point
def two_sum(nums, left, target)
  sums = []
  right = nums.length - 1
  while left < right
    result = nums[left] + nums[right]
    if result == target
      sums << [nums[left], nums[right]]
      left += 1
      right -= 1
      left += 1 while nums[left] == nums[left - 1]
      right -= 1 while nums[right] == nums[right + 1]
    elsif result < target
      left += 1
    else
      right -= 1
    end
  end
  sums
end
