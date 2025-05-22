# Solution using two_sum_ii as inspiration
# Doesn't utilize sets, skips over repeated values by iteration
def three_sum(nums)
  nums = nums.sort!
  results = []

  (0...nums.length - 2).each do |i|
    next if i > 0 && nums[i] == nums[i - 1]

    left = i + 1
    right = nums.length - 1
    while left < right
      sum = nums[i] + nums[left] + nums[right]
      if sum == 0
        result = [nums[i], nums[left], nums[right]]
        results << result
        left += 1
        right += 1

        left += 1 while left < right && nums[left] == nums[left - 1]
        right -= 1 while left < right && nums[right] == nums[right + 1]
      elsif sum < 0
        left += 1
      else
        right -= 1
      end
    end
  end

  results
end

# Solution failed because sets weren't efficient enough
def three_sum(nums)
  nums = nums.sort!
  results = []
  seen_triplets = Set.new
  (0...nums.length - 2).each do |i|
    left = i + 1
    right = nums.length - 1
    while left < right
      sum = nums[i] + nums[left] + nums[right]
      if sum == 0
        result = [nums[i], nums[left], nums[right]]
        unless seen_triplets.include?(result)
          results << result
          seen_triplets << result
        end

        left += 1
      elsif sum < 0
        left += 1
      else
        right -= 1
      end
    end
  end

  results
end

# Failed solution utilizing two_sum inspiration
def three_sum(nums)
  two_sum = Hash.new { |h, k| h[k] = [] }
  answers = []
  exists = Set.new
  (0...nums.length - 2).each do |i|
    (i + 1...nums.length - 1).each do |j|
      a = nums[i]
      b = nums[j]
      two_sum[0 - (a + b)] << [[a, b], j]
    end
  end
  (2...nums.length).each do |k|
    c = nums[k]
    next if two_sum[c].empty?

    two_sum[c].each do |values, j|
      next unless k > j

      new_array = values + [c]
      new_set = new_array.to_set
      next if exists.include?(new_set)

      answers << new_array
      exists << new_set
    end
  end
  answers
end
