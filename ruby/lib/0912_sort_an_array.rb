# frozen_string_literal: true

def sort_array(nums)
  return nums if nums.length <= 1

  half = nums.length / 2
  left = sort_array(nums[0...half])
  right = sort_array(nums[half..-1])
  merge(left, right)
end

def merge(left, right)
  left_idx = 0
  right_idx = 0
  merged = []
  until left_idx >= left.length || right_idx >= right.length
    if left[left_idx] < right[right_idx]
      merged << left[left_idx]
      left_idx += 1
    else
      merged << right[right_idx]
      right_idx += 1
    end
  end
  until left_idx >= left.length
    merged << left[left_idx]
    left_idx += 1
  end
  until right_idx >= right.length
    merged << right[right_idx]
    right_idx += 1
  end
  merged
end
