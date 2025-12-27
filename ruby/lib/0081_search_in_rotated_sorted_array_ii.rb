# frozen_string_literal: true

# My logic using a forward to deal with duplicates
def search(nums, target)
  left = 0
  right = nums.length - 1
  while left <= right
    middle = (left + right) / 2
    return true if nums[middle] == target

    forward = left
    forward += 1 while forward < middle && nums[forward] == nums[left]
    if nums[forward].between?(nums[left], nums[middle])
      if target.between?(nums[left], nums[middle])
        right = middle - 1
      else
        left = middle + 1
      end
    elsif target.between?(nums[middle], nums[right])
      left = middle + 1
    else
      right = middle - 1
    end
  end
  false
end

# Neetcode way
def search(nums, target)
  left = 0
  right = nums.length - 1
  while left <= right
    middle = (left + right) / 2
    return true if nums[middle] == target

    if nums[left] < nums[middle]
      if target.between?(nums[left], nums[middle])
        right = middle - 1
      else
        left = middle + 1
      end
    elsif nums[left] > nums[middle]
      if target.between?(nums[middle], nums[right])
        left = middle + 1
      else
        right = middle - 1
      end
    else
      left += 1
    end
  end
  false
end
