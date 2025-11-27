# frozen_string_literal: true

def find_error_nums(nums)
  mismatch = []
  count = Hash.new(0)
  nums.each { |num| count[num] += 1 }
  count.each { |k, v| mismatch << k if v == 2 }
  (1..nums.length).each do |nbr|
    if count[nbr].zero?
      mismatch << nbr
      break
    end
  end
  mismatch
end
