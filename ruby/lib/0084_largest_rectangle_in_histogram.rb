def largest_rectangle_area(heights)
  stack = []
  max_area = 0
  heights.each_with_index do |height, index|
    if stack.empty? || stack[-1][0] <= height
      stack << [height, index]
    else
      last_index = nil
      while !stack.empty? && stack[-1][0] > height
        last_height, last_index = stack.pop
        area = (index - last_index) * last_height
        max_area = [max_area, area].max
      end
      stack << [height, last_index]
    end
  end

  stack.each do |height, index|
    area = (heights.length - index) * height
    max_area = [max_area, area].max
  end

  max_area
end
