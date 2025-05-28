def find_min(nums)
  left = 0
  right = nums.length - 1
  min = Float::INFINITY

  while left <= right
    middle = (left + right) / 2
    min = [min, nums[middle]].min
    if nums[middle] < nums[right]
      right = middle - 1
    else
      left = middle + 1
    end
  end

  min
end
