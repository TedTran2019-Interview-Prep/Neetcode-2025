# frozen_string_literal: true

# Better time complexity utilizing sort
def smaller_numbers_than_current(nums)
  sorted = nums.sort
  smaller = {}
  sorted.each_with_index do |num, idx|
    prev = idx.zero? ? -1 : sorted[idx - 1]
    next if prev == num

    smaller[num] = idx
  end
  nums.map { |num| smaller[num] }
end

def smaller_numbers_than_current(nums)
  smaller = Array.new(nums.length, 0)
  nums.each_with_index do |outer, y|
    nums.each_with_index do |inner, x|
      next if y == x

      smaller[y] += 1 if outer > inner
    end
  end
  smaller
end
