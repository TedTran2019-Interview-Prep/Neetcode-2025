# Constant space
def trap(height)
  left = 0
  right = height.length - 1
  left_max = height[left]
  right_max = height[right]
  water = 0

  while left < right
    if height[left] < height[right]
      water += left_max - height[left]
      left += 1
      left_max = [left_max, height[left]].max
    else
      water += right_max - height[right]
      right -= 1
      right_max = [right_max, height[right]].max
    end
  end

  water
end

# O(N) space
def trap(height)
  water = 0
  # Left max
  left_max = []
  height.each do |h|
    left_max << if left_max.empty?
                  h
                else
                  [left_max[-1], h].max
                end
  end

  # Right max
  right_max = []
  height.reverse.each do |h|
    right_max << if right_max.empty?
                   h
                 else
                   [right_max[-1], h].max
                 end
  end
  right_max.reverse!

  height.each_with_index do |h, index|
    water += [left_max[index], right_max[index]].min - h
  end

  water
end
