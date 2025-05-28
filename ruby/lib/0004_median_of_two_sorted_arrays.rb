def find_median_sorted_arrays(nums1, nums2)
  a = nums1
  b = nums2
  total = nums1.length + nums2.length
  half = total / 2
  # Ensure B is the shorter/equal length array
  a, b = b, a if b.length < a.length

  left = 0
  right = a.length - 1
  # Guaranteed median
  while true
    # Number of elements in i + j will total up to half
    i = (left + right) / 2 # A
    j = half - i - 2 # B

    a_left = i >= 0 ? a[i] : -Float::INFINITY
    a_right = (i + 1) < a.length ? a[i + 1] : Float::INFINITY
    b_left = j >= 0 ? b[j] : -Float::INFINITY
    b_right = (j + 1) < b.length ? b[j + 1] : Float::INFINITY

    if a_left <= b_right && b_left <= a_right
      return [a_right, b_right].min if total.odd?

      return ([a_left, b_left].max + [a_right, b_right].min).fdiv(2)

    elsif a_left > b_right
      right = i - 1
    else
      left = i + 1
    end
  end
end
