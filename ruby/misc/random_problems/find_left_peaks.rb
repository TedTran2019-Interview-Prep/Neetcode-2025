# def find_left_peaks(arr)
#   left_peaks = []
#   right_max = []

#   arr.reverse.each do |num|
#     if right_max.empty?
#       right_max << num
#     else
#       right_max << [right_max.last, num].max
#     end
#   end
#   right_max.reverse!

#   arr.each_with_index do |num, idx|
#     left_peaks << num if num >= right_max[idx]
#   end

#   left_peaks
# end

def find_left_peaks(arr)
  right_max = arr.reverse.reduce([]) do |acc, num|
    acc << (acc.empty? ? num : [acc.last, num].max)
  end.reverse

  arr.select.with_index { |num, idx| num >= right_max[idx] }
end
