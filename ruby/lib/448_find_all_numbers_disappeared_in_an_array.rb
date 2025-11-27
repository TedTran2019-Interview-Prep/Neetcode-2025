# frozen_string_literal: true

# No extra space using marking
def find_disappeared_numbers(nums)
  missing = []
  nums.each do |num|
    real_num = num.negative? ? num * -1 : num

    mark = nums[real_num - 1]
    nums[real_num - 1] = mark.negative? ? mark : mark * -1
  end

  nums.each_with_index { |num, idx| missing << idx + 1 if num.positive? }
  missing
end

def find_disappeared_numbers(nums)
  count = Hash.new(0)
  nums.each { |num| count[num] += 1 }
  missing = []
  (1..nums.length).each do |nbr|
    missing << nbr if count[nbr].zero?
  end
  missing
end
