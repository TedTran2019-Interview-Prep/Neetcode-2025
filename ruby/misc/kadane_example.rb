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
