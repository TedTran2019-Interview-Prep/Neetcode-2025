# frozen_string_literal: true

def max_sub_array(nums)
  return 0 if nums.empty?

  sum = 0
  max_sum = nums.first
  nums.each do |num|
    sum = 0 if sum.negative?
    sum += num
    max_sum = [sum, max_sum].max
  end
  max_sum
end
