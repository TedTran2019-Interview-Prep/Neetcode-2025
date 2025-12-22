# frozen_string_literal: true

def find_closest_elements(arr, k, x)
  left = 0
  right = arr.length - 1
  until right - left == k - 1
    if (arr[left] - x).abs <= (arr[right] - x).abs
      right -= 1
    else
      left += 1
    end
  end
  arr[left..right]
end
