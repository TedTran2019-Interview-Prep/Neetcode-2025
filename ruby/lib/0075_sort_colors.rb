# frozen_string_literal: true

# One pass three pointer partitioning, no extra space
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

# O(N) extra space using hashmap
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

# Two pass no extra space
def sort_colors(nums)
  new_start_idx = put_at_start(0, 0, nums)
  put_at_start(new_start_idx, 1, nums)
end

def put_at_start(start_idx, num, nums)
  last_idx = nums.length - 1
  while start_idx < last_idx
    if nums[start_idx] == num
      start_idx += 1
    elsif nums[last_idx] == num
      nums[start_idx], nums[last_idx] = nums[last_idx], nums[start_idx]
      start_idx += 1
      last_idx -= 1
    else
      last_idx -= 1
    end
  end
  nums[start_idx] == num ? start_idx + 1 : start_idx
end
