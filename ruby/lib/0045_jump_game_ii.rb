# frozen_string_literal: true

def jump(nums)
  left = 0
  right = 0
  jumps = 0
  while right < nums.length - 1
    max_reach = 0
    (left..right).each do |position|
      max_reach = [max_reach, nums[position] + position].max
    end
    left = right + 1
    right = max_reach
    jumps += 1
  end
  jumps
end
