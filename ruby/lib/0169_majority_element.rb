# frozen_string_literal: true

# Boyer-Moore Voting Algorithm
def majority_element(nums)
  candidate = 0
  count = 0
  nums.each do |num|
    candidate = num if count.zero?
    count += candidate == num ? 1 : -1
  end
  candidate
end

def majority_element(nums)
  counts = nums.tally
  max = nums.first
  counts.each { |num, count| max = num if count > counts[max] }
  max
end
