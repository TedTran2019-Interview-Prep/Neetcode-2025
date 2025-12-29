# frozen_string_literal: true

# This is MountainArray's API interface.
# You should not implement it, or speculate about its implementation
# class MountainArray
#    def get(index)
#    end
#    def length()
#  end
# end
def findInMountainArray(target, mountainArr)
  @values = {}
  peak_idx = find_peak(mountainArr)
  binary_search(0, peak_idx, target, mountainArr) ||
    binary_search_on_reverse_sorted(peak_idx + 1, mountainArr.length - 1, target, mountainArr) ||
    -1
end

def find_peak(mountain_arr)
  left = 0
  right = mountain_arr.length - 1
  while left < right
    middle_idx = (left + right) / 2
    after_mid_idx = middle_idx + 1
    middle = mountain_arr.get(middle_idx)
    after_middle = after_mid_idx >= mountain_arr.length ? -Float::INFINITY : @values[after_mid_idx] || mountain_arr.get(after_mid_idx)
    @values[middle_idx] ||= middle
    @values[after_mid_idx] ||= after_middle

    if middle > after_middle
      right = middle_idx
    else
      left = middle_idx + 1
    end
  end
  left
end

# def find_peak(mountain_arr)
#   left = 0
#   right = mountain_arr.length - 1
#   while left <= right
#     middle_idx = (left + right) / 2
#     before_mid_idx = middle_idx - 1
#     after_mid_idx = middle_idx + 1
#     before_middle = before_mid_idx.negative? ? -Float::INFINITY : @values[before_mid_idx] || mountain_arr.get(middle_idx - 1)
#     middle = mountain_arr.get(middle_idx)
#     after_middle = after_mid_idx >= mountain_arr.length ? -Float::INFINITY : @values[after_mid_idx] || mountain_arr.get(after_mid_idx)

#     @values[before_mid_idx] ||= before_middle
#     @values[middle_idx] ||= middle
#     @values[after_mid_idx] ||= after_middle

#     if middle > before_middle && middle > after_middle
#       return middle_idx
#     elsif middle > before_middle && middle < after_middle
#       left = middle_idx + 1
#     else
#       right = middle_idx - 1
#     end
#   end
#   puts 'This should never happen'
# end

def binary_search(left, right, target, mountain_arr)
  while left <= right
    middle_idx = (left + right) / 2
    middle = @values[middle_idx] || mountain_arr.get(middle_idx)
    @values[middle_idx] ||= middle

    if middle == target
      return middle_idx
    elsif middle < target
      left = middle_idx + 1
    else
      right = middle_idx - 1
    end
  end
  nil
end

def binary_search_on_reverse_sorted(left, right, target, mountain_arr)
  while left <= right
    middle_idx = (left + right) / 2
    middle = @values[middle_idx] || mountain_arr.get(middle_idx)
    @values[middle_idx] ||= middle

    if middle == target
      return middle_idx
    elsif middle < target
      right = middle_idx - 1
    else
      left = middle_idx + 1
    end
  end
  nil
end
