# frozen_string_literal: true

def k_closest(points, k)
  max_heap = Heap.new { |a, b| a[0] > b[0] }
  points.each do |point|
    distance = euclidean_distance(*point)
    if max_heap.size < k
      max_heap << [distance, point]
    else
      max_heap.offer([distance, point])
    end
  end
  max_heap.map { |_distance, point| point }
end

# From origin
def euclidean_distance(x, y)
  Math.sqrt(x**2 + y**2)
end
