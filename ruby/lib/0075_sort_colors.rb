# frozen_string_literal: true

def sort_colors(nums)
  count = Hash.new(0)
  nums.each { |num| count[num] += 1 }
  index = 0
  (0..2).each do |num|
    count[num].times do
      nums[index] = num
      index += 1
    end
  end
end

# One pass three pointer partitioning
def sort_colors(nums)
  low = 0
  middle = 0
  high = nums.length - 1
  while middle <= high
    if nums[middle] == 0
      nums[low], nums[middle] = nums[middle], nums[low]
      low += 1
      middle += 1
    elsif nums[middle] == 1
      middle += 1
    else
      nums[high], nums[middle] = nums[middle], nums[high]
      high -= 1
    end
  end
end
