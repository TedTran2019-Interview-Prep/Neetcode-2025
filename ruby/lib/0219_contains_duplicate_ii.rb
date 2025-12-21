# frozen_string_literal: true

def contains_nearby_duplicate(nums, k)
  count = Hash.new(0)
  right = 0
  while right < nums.length && right <= k
    count[nums[right]] += 1
    return true if count[nums[right]] >= 2

    right += 1
  end

  left = 0
  while right < nums.length
    count[nums[left]] -= 1
    count[nums[right]] += 1
    return true if count[nums[right]] >= 2

    left += 1
    right += 1
  end
  false
end
