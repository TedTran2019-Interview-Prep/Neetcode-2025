# frozen_string_literal: true

def max_product(nums)
  result = nums.max
  min = 1
  max = 1
  nums.each do |num|
    if num.zero?
      min = 1
      max = 1
      next
    end

    tmp = max
    max = [max * num, min * num, num].max
    min = [tmp * num, min * num, num].min
    result = [max, result].max
  end
  result
end
