# frozen_string_literal: true

def get_concatenation(nums)
  ans = Array.new(nums.length * 2)
  nums.each_with_index do |num, idx|
    ans[idx] = num
    ans[idx + nums.length] = num
  end
  ans
end
