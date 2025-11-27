# frozen_string_literal: true

def find_max_consecutive_ones(nums)
  current = 0
  max = 0
  nums.each do |num|
    if num == 1
      current += 1
    elsif num.zero?
      max = [max, current].max
      current = 0
    end
  end
  max = [max, current].max
end
