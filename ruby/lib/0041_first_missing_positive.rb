# Simpler, using of 'x'->'o' just use N+1.
# This deals with 0 and negative number cases in a much cleaner way
def first_missing_positive(nums)
  # First run to set pointless values to length + 1
  nums.each_with_index do |num, index|
    nums[index] = nums.length + 1 if num < 1 || num > nums.length
  end
  # Second pass to flip positive to negative
  nums.each_with_index do |num, index|
    next unless num.abs.between?(1, nums.length)

    replacement = nums[num.abs - 1]
    nums[num.abs - 1] = -replacement.abs
  end

  # Third pass to find first positive
  nums.each_with_index do |num, index|
    return index + 1 if num.positive?
  end

  nums.length + 1
end

def first_missing_positive(nums)
  # First run to set pointless values to 'x'
  nums.each_with_index do |num, index|
    nums[index] = 'x' if num < 1 || num > nums.length
  end
  # Second pass to flip x to o, positive to negative
  nums.each_with_index do |num, index|
    next unless num.is_a?(Integer) && num.abs.between?(1, nums.length)

    replacement = nums[num.abs - 1]
    if replacement == 'x'
      nums[num.abs - 1] = 'o'
    elsif replacement == 'o'
      next
    else
      nums[num.abs - 1] = -replacement.abs
    end
  end

  # Third pass to find first positive
  nums.each_with_index do |num, index|
    if num.is_a? Integer
      return index + 1 if num.positive?
    elsif num == 'x'
      return index + 1
    end
  end

  nums.length + 1
end
