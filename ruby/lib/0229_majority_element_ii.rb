# frozen_string_literal: true

def majority_element(nums)
  # Finding top two candidates
  candidate1 = nil
  candidate2 = nil
  count1 = 0
  count2 = 0
  nums.each do |num|
    if num == candidate1
      count1 += 1
    elsif num == candidate2
      count2 += 1
    elsif count1.zero?
      candidate1 = num
      count1 = 1
    elsif count2.zero?
      candidate2 = num
      count2 = 1
    else
      count1 -= 1
      count2 -= 1
    end
  end
  # Seeing if count of top two candidates is greater than n / 3
  count1 = 0
  count2 = 0
  nums.each do |num|
    count1 += 1 if num == candidate1
    count2 += 1 if num == candidate2
  end
  answer = []
  answer << candidate1 if count1 > nums.length / 3
  answer << candidate2 if count2 > nums.length / 3
  answer
end
