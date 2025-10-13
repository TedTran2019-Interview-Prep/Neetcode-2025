# frozen_string_literal: true

def length_of_lis(nums)
  dp = Array.new(nums.length, 1)

  (nums.length - 1).downto(0).each do |y|
    (y + 1...nums.length).each do |x|
      dp[y] = [dp[y], dp[x] + 1].max if nums[y] < nums[x]
    end
  end

  dp.max
end
