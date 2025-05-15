# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def longest_ones(nums, k)
  left = 0
  max_length = 0
  zeroes = 0

  nums.each_with_index do |nbr, right|
    zeroes += 1 if nbr.zero?

    while zeroes > k
      zeroes -= 1 if nums[left].zero?
      left += 1
    end

    max_length = [max_length, right - left + 1].max
  end

  max_length
end
