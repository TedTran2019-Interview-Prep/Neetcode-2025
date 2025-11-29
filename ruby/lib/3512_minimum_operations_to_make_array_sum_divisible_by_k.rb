# frozen_string_literal: true

def min_operations(nums, k)
  sum = nums.sum
  operations = 0
  until (sum % k).zero?
    sum -= 1
    operations += 1
  end
  operations
end
