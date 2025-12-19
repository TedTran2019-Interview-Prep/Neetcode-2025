# frozen_string_literal: true

def merge(nums1, m, nums2, n)
  total = nums1.length - 1
  m -= 1
  n -= 1
  while m >= 0 && n >= 0
    if nums1[m] > nums2[n]
      nums1[total] = nums1[m]
      m -= 1
    else
      nums1[total] = nums2[n]
      n -= 1
    end
    total -= 1
  end

  while n >= 0
    nums1[total] = nums2[n]
    total -= 1
    n -= 1
  end

  while m >= 0
    nums1[total] = nums1[m]
    total -= 1
    m -= 1
  end

  nums1
end
