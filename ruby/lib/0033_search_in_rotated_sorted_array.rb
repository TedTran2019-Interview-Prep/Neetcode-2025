# Did it again
def search(nums, target)
  left = 0
  right = nums.length - 1

  while left <= right
    middle = (left + right) / 2
    return middle if nums[middle] == target

    if nums[left] <= nums[middle]
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

  -1
end

# Sorted array is pivoted (two sorted halves around a pivot, left and right)
# Then you check to see whether you want to go within the sorted or unsorted portion
# If the left is sorted
# - If the target's value is between left/middle, go left, else go right
# If the right is sorted
# - If the target's value is between middle/right, go right, else, go left
def search(nums, target)
  left = 0
  right = nums.length - 1

  while left <= right
    middle = (left + right) / 2

    return middle if nums[middle] == target

    # Left sorted portion
    if nums[middle] >= nums[left]
      if target.between?(nums[left], nums[middle])
        right = middle - 1
      else
        left = middle + 1
      end
    # Right sorted portion
    elsif target.between?(nums[middle], nums[right])
      left = middle + 1
    else
      right = middle - 1
    end
  end

  -1
end
