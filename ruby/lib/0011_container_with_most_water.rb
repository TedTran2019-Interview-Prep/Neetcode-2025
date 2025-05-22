def max_area(height)
  most_water = 0
  left = 0
  right = height.length - 1

  while left < right
    water = (right - left) * [height[left], height[right]].min
    most_water = [most_water, water].max
    if height[left] > height[right]
      right -= 1
    else
      left += 1
    end
  end

  most_water
end
