# frozen_string_literal: true

def tribonacci(n)
  trib = [0, 1, 1]
  return trib[n] if n <= 2

  trib << trib[-1] + trib[-2] + trib[-3] until trib.length == n + 1
  trib[-1]
end
