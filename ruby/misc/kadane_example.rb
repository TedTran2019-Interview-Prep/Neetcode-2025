def kadane(array)
  return 0 if array.empty?

  max_value = -Float::INFINITY
  current_value = 0

  array.each do |nbr|
    current_value = 0 if current_value.negative?
    current_value += nbr
    max_value = current_value if current_value > max_value
  end

  max_value
end

# Kadane's
def max_subarray_sum(arr)
  max_sum = arr[0]
  max_ending = arr[0]

  (1...arr.length).each do |i|
    max_ending = [max_ending + arr[i], arr[i]].max
    max_sum = [max_sum, max_ending].max
  end

  max_sum
end
