# frozen_string_literal: true

def missing_number(nums)
  missing = nums.inject { |accu, num| accu ^ num }
  (0..nums.length).each { |num| missing ^= num }
  missing
end

def missing_number(nums)
  gauss_sum = (nums.length * (nums.length + 1)) / 2
  gauss_sum - nums.sum
end
