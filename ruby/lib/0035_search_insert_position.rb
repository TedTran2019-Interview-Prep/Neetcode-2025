# frozen_string_literal: true

def search_insert(nums, target)
  left = 0
  right = nums.length - 1
  while left <= right
    middle = (left + right) / 2
    if nums[middle] == target
      return middle
    elsif nums[middle] < target
      left = middle + 1
    else
      right = middle - 1
    end
  end
  left
end
