# frozen_string_literal: true

# Hierholzer's algorithm
# Reverse lex order so popping smallest lex is O(1)
# Since you're pushing at the end (last location, second to last... first), need to reverse at end
def find_itinerary(tickets)
  travel_graph = Hash.new { |h, k| h[k] = [] }
  tickets.sort! { |a, b| b <=> a }
  tickets.each { |from, to| travel_graph[from] << to }
  itinerary = []
  dfs = lambda do |source|
    destinations = travel_graph[source]
    while destinations && !destinations.empty?
      next_stop = destinations.pop
      dfs.call(next_stop)
    end
    itinerary << source
  end

  dfs.call('JFK')
  itinerary.reverse
end

# Neetcode solution trying every combination but with removals, still fails on 4th test case
def find_itinerary(tickets)
  travel_graph = Hash.new { |h, k| h[k] = [] }
  tickets.sort!
  tickets.each { |from, to| travel_graph[from] << to }
  itinerary = ['JFK']
  dfs = lambda do |location|
    return true if itinerary.length == (tickets.length + 1)

    temp = travel_graph[location].dup
    temp.each_with_index do |destination, idx|
      travel_graph[location].delete_at(idx)
      itinerary << destination
      return itinerary if dfs.call(destination)

      travel_graph[location].insert(idx, destination)
      itinerary.pop
    end
    false
  end
  dfs.call('JFK')
end

# Naive, times out on 4th test case
def find_itinerary(tickets)
  travel_graph = Hash.new { |h, k| h[k] = [] }
  tickets.each_with_index { |(from, to), idx| travel_graph[from] << [to, idx] }
  travel_graph.each_key { |key| travel_graph[key].sort! { |a, b| a[0] <=> b[0] } }
  itinerary = []
  visited = Set.new
  dfs = lambda do |location, index|
    itinerary << location
    visited << index

    return true if itinerary.length == (tickets.length + 1)

    travel_graph[location].each do |destination, idx|
      next if visited.include?(idx)

      return itinerary if dfs.call(destination, idx)
    end

    itinerary.pop
    visited.delete(index)
    false
  end
  dfs.call('JFK', -1)
end
