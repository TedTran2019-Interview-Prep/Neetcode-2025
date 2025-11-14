# frozen_string_literal: true

# Cleaner solution just utilizing Dijkstra's
# Practically the same, except:
# minus the inner heap array manipulation
# minimum time is just travel time
# adds travel time to new travel time to keep rolling update (Dijkstra)
def network_delay_time(times, n, k)
  times_hashmap = Hash.new { |h, k| h[k] = [] }
  times.each { |source, target, travel_time| times_hashmap[source] << [travel_time, target] }
  visited_nodes = Set.new
  min_heap = Heap.new { |a, b| a[0] < b[0] } # Time to reach next node, next node
  min_heap << [0, k]
  minimum_time = 0
  until min_heap.empty?
    travel_time, node = min_heap.pop
    next if visited_nodes.include?(node)

    visited_nodes << node
    minimum_time = travel_time
    times_hashmap[node].each do |new_travel_time, new_destination|
      min_heap << [travel_time + new_travel_time, new_destination]
    end
  end
  visited_nodes.length == n ? minimum_time : -1
end

# My personal solution
def network_delay_time(times, n, k)
  times_hashmap = Hash.new { |h, k| h[k] = [] }
  times.each { |source, target, travel_time| times_hashmap[source] << [travel_time, target] }
  visited_nodes = Set.new
  min_heap = Heap.new { |a, b| a[0] < b[0] } # Time to reach next node, next node
  min_heap << [0, k]
  minimum_time = 0
  until min_heap.empty?
    travel_time, node = min_heap.pop
    next if visited_nodes.include?(node)

    visited_nodes << node
    min_heap.heap.each { |arr| arr[0] -= travel_time }
    minimum_time += travel_time
    times_hashmap[node].each { |new_travel_time, new_destination| min_heap << [new_travel_time, new_destination] }
  end
  visited_nodes.length == n ? minimum_time : -1
end
