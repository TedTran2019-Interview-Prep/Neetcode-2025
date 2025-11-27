# frozen_string_literal: true

def shuffle(nums, n)
  shuffle = Array.new(nums.length)
  (0...n).each do |idx|
    x = nums[idx]
    y = nums[idx + n]
    double = idx * 2
    shuffle[double] = x
    shuffle[double + 1] = y
  end
  shuffle
end
