# frozen_string_literal: true

# DP
def can_partition(nums)
  total = nums.sum
  return false if total.odd?

  half = total / 2
  set = Set.new
  set << 0

  (nums.length - 1).downto(0).each do |idx|
    num = nums[idx]
    set.to_a.each do |prev_total|
      sum = prev_total + num
      return true if sum == half

      set << sum
    end
  end
  false
end

# Aiming for memoization
def can_partition(nums)
  total = nums.sum
  return false if total.odd?

  half = total / 2
  memo = {}

  dfs = lambda do |index, remain|
    return true if remain.zero?
    return false if index >= nums.length || remain.negative?

    key = [index, remain]
    return memo[key] unless memo[key].nil?

    memo[key] = dfs.call(index + 1, remain - nums[index]) || dfs.call(index + 1, remain)
  end
  dfs.call(0, half)
end

# Naive solution with total (aiming for 1/2 total)
def can_partition(nums)
  total = nums.sum
  return false if total.odd?

  half = total / 2
  dfs = lambda do |index, remain|
    return true if remain.zero?
    return false if index >= nums.length

    dfs.call(index + 1, remain - nums[index]) || dfs.call(index + 1, remain)
  end
  dfs.call(0, half)
end

# Naive solution with two sums (Logic here may be incorrect too)
def can_partition(nums)
  total = nums.sum
  dfs = lambda do |index, sum1, sum2|
    return sum1 == sum2 if index >= nums.length

    match = false
    (index...nums.length).each do |start_idx|
      num = nums[start_idx]
      result1 = dfs.call(start_idx + 1, sum1 + num, sum2 - num)
      result2 = dfs.call(start_idx + 2, sum1, sum2)
      match = result1 || result2 if result1 || result2
      break if match
    end
    match
  end
  dfs.call(0, 0, total)
end
