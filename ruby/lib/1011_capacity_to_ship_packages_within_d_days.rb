# frozen_string_literal: true

def ship_within_days(weights, days)
  left = 1
  right = weights.sum
  while left <= right
    capacity = (left + right) / 2
    result = can_ship?(capacity, days, weights)
    if result
      right = capacity - 1
    else
      left = capacity + 1
    end
  end
  left
end

def can_ship?(capacity, days, weights)
  capacity_remaining = capacity
  weights.each do |weight|
    return false if weight > capacity

    if (capacity_remaining - weight).negative?
      capacity_remaining = capacity - weight
      days -= 1
      return false if days.zero?
    else
      capacity_remaining -= weight
    end
  end
  true
end
