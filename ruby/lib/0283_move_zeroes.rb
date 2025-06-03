def move_zeroes(nums)
  find_zero = 0
  while find_zero < nums.length
    break if nums[find_zero] == 0

    find_zero += 1
  end
  return nums if find_zero >= nums.length

  zero_counter = 1
  (find_zero + 1...nums.length).each do |idx|
    if nums[idx] == 0
      zero_counter += 1
    else
      nums[idx], nums[idx - zero_counter] = nums[idx - zero_counter], nums[idx]
    end
  end

  nums
end
