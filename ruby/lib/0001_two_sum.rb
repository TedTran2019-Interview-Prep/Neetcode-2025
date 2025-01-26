# frozen_string_literal: true

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
# Only one valid answer exists.
def two_sum(nums, target)
  complement = {}
  nums.each_with_index do |num, idx|
    return [idx, complement[num]] if complement[num]

    complement[target - num] = idx
  end
end
