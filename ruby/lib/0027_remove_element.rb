# frozen_string_literal: true

def remove_element(nums, val)
  k = 0
  nums.each do |num|
    if num != val
      nums[k] = num
      k += 1
    end
  end
  k
end
