# 1. **Longest Subarray with Sum Equals K**
#    Given an array of integers `nums` and an integer `k`, find the length of the longest contiguous subarray whose sum equals `k`.

#    * **Input**:
#    * An integer array `nums` of length `n`.
#    * An integer `k`.
#    * **Output**:
#    * An integer representing the maximum length of a subarray summing to `k`.
#    * **Constraints**:
#    * `1 <= n <= 10^5`
#    * `-10^5 <= nums[i] <= 10^5`
#    * `-10^9 <= k <= 10^9`
#    * **Example**:

#    ```
#    Input: nums = [1, -1, 5, -2, 3], k = 3
#    Output: 4
#    Explanation: The subarray [1, -1, 5, -2] sums to 3 and has length 4.
#    ```
# ---
#
# length n nums, integer k
# maximum length of subarray sums up to k
# Sliding window where condition is to keep value as K
# nums: 1 -1 5 -2 3, k == 3
# [1 0 5 3 6]
# -2   5
# 0.    3
# 2.    1
# k - ele = el
# 4 elements == 3
# 2 element to 4th element == 3
# two_sum on a prefix map

# Plan:
# max_length = 0
# Make a prefix map (all numbers summed up so far)
# Go through prefix map, if value is found, just put that index + 1 into map
# two_sum = {}
# iterate through prefix map, ele
#   two_sum[k - ele] = index
#   if two_sum[ele]
#     length = index - two_sum[ele]
#     compare max length with length
# return max length

def longest_subarray(nums, k)
  max_length = 0
  # Prefix Map
  prefix_map = []
  sum = 0
  nums.each do |num|
    sum += num
    prefix_map << sum
  end

  prefix_map.each_with_index do |num, idx|
    max_length = [idx + 1, max_length].max if num == k
  end

  two_sum = {}
  prefix_map.each_with_index do |num, idx|
    two_sum[k - num] = idx
    if two_sum[num]
      length = idx - two_sum[num]
      max_length = [length, max_length].max
    end
  end

  max_length
end

puts longest_subarray([], 0)
puts longest_subarray([1], 3)
puts longest_subarray([1], 1)
puts longest_subarray([1, 1, 1, 1, 1, 1], 1)
puts longest_subarray([1, -1, 5, -2, 3], 3)
