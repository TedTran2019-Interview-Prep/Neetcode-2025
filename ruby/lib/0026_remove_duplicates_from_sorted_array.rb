# frozen_string_literal: true

def remove_duplicates(nums)
  return nums.length if nums.length <= 1

  k = 1
  (1...nums.length).each do |idx|
    if nums[idx] != nums[idx - 1]
      nums[k] = nums[idx]
      k += 1
    end
  end
  k
end
