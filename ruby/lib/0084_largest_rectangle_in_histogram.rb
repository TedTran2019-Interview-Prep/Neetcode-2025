# Redo
def largest_rectangle_area(heights)
  stack = []
  max = 0
  heights.each_with_index do |height, idx|
    last_idx = idx
    while !stack.empty? && stack[-1][0] > height
      start_height, start_idx = stack.pop
      area = start_height * (idx - start_idx)
      max = [max, area].max
      last_idx = start_idx
    end

    stack << [height, last_idx]
  end

  stack.each do |height, start_idx|
    area = (heights.length - start_idx) * height
    max = [max, area].max
  end

  max
end

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
