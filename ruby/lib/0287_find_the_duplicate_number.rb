def find_duplicate(nums)
  slow = nums[0]
  fast = nums[nums[0]]
  until slow == fast
    slow = nums[slow]
    fast = nums[nums[fast]]
  end

  slow2 = 0
  until slow == slow2
    slow = nums[slow]
    slow2 = nums[slow2]
  end

  slow
end
