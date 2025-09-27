# frozen_string_literal: true

def rob(nums)
  return nums.first if nums.length <= 1

  [rob_one(nums[1..-1]), rob_one(nums[0...-1])].max
end

# Naive
def rob_one(nums)
  dfs = lambda do |index|
    return 0 if index >= nums.length

    nums[index] + [dfs.call(index + 2), dfs.call(index + 3)].max
  end
  [dfs.call(0), dfs.call(1)].max
end

# DP no extra space
def rob_one(nums)
  prev_1 = 0
  prev_2 = 0
  nums.each_with_index do |num, idx|
    temp = [num + prev_2, prev_1].max
    prev_2 = prev_1
    prev_1 = temp
  end
  prev_1
end
