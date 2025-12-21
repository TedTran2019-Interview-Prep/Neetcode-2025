# frozen_string_literal: true

def rotate(nums, k)
  nums.reverse!
  k %= nums.length
  left = 0
  right = k - 1
  while left < right
    nums[left], nums[right] = nums[right], nums[left]
    left += 1
    right -= 1
  end

  left = k
  right = nums.length - 1
  while left < right
    nums[left], nums[right] = nums[right], nums[left]
    left += 1
    right -= 1
  end
  nums
end
