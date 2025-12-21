# frozen_string_literal: true

def min_sub_array_len(target, nums)
  left = 0
  right = 0
  total = 0
  length = 0
  min_length = Float::INFINITY
  while right < nums.length
    total += nums[right]
    length += 1
    right += 1
    while total >= target
      min_length = [min_length, length].min
      total -= nums[left]
      left += 1
      length -= 1
    end
  end
  min_length == Float::INFINITY ? 0 : min_length
end

def min_sub_array_len(target, nums)
  left = 0
  right = 0
  total = 0
  length = 0
  min_length = Float::INFINITY
  while true
    if total >= target
      min_length = [min_length, length].min if total >= target
      total -= nums[left]
      left += 1
      length -= 1
    else
      break if right >= nums.length

      total += nums[right]
      right += 1
      length += 1
    end
  end
  min_length == Float::INFINITY ? 0 : min_length
end
