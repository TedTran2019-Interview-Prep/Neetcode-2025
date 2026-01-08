# frozen_string_literal: true

# Heap solution
def car_pooling(trips, capacity)
  min_heap = Heap.new { |a, b| a[2] < b[2] } # [passengers, from, to]
  sorted_trips = trips.sort { |a, b| a[1] <=> b[1] }
  time = 0
  sorted_trips.each do |trip|
    time = trip[1]
    while !min_heap.empty? && min_heap.peek[2] <= time
      passenger_dropoff = min_heap.pop[0]
      capacity += passenger_dropoff
    end

    min_heap << trip
    capacity -= trip[0]
    return false if capacity.negative?
  end
  true
end

# O(N) solution with from/to constraint
def car_pooling(trips, capacity)
  passenger_count = Array.new(1001, 0) # 0, 1000 range for from-to
  trips.each do |passenger, from, to|
    passenger_count[from] += passenger
    passenger_count[to] -= passenger
  end
  curr_capacity = 0
  passenger_count.each do |count|
    curr_capacity += count
    return false if curr_capacity > capacity
  end
  true
end
