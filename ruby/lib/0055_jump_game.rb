# frozen_string_literal: true

# Backwards greedy approach
def can_jump(nums)
  return true if nums.length == 1

  idx = nums.length - 2
  goalpost = nums.length - 1
  until idx.zero?
    goalpost = idx if idx + nums[idx] >= goalpost
    idx -= 1
  end
  nums[idx] >= goalpost
end

# Forwards greedy approach
def can_jump(nums)
  max_reach = 0
  nums.each_with_index do |num, idx|
    return false if idx > max_reach

    max_reach = [max_reach, idx + num].max
  end
  true
end
