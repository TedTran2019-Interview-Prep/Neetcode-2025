def two_sum(numbers, target)
  left = 0
  right = numbers.length - 1
  while left < right
    if numbers[left] + numbers[right] == target
      return [left + 1, right + 1]
    elsif numbers[left] + numbers[right] > target
      right -= 1
    else
      left += 1
    end
  end
  "Exactly one solution, so this shouldn't ever be reached"
end
