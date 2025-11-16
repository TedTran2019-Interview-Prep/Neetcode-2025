# frozen_string_literal: true

# Bellman-Ford
def find_cheapest_price(n, flights, src, dst, k)
  prices = Array.new(n, Float::INFINITY)
  prices[src] = 0
  (k + 1).times do
    temp_prices = prices.dup
    flights.each do |from, to, price|
      next if prices[from] == Float::INFINITY

      temp_prices[to] = prices[from] + price if prices[from] + price < temp_prices[to]
    end
    prices = temp_prices
  end
  prices[dst] == Float::INFINITY ? -1 : prices[dst]
end

# Naive brute force, times out on test case 30/58
def find_cheapest_price(n, flights, src, dst, k)
  flight_map = Hash.new { |h, k| h[k] = [] }
  flights.each { |from, to, price| flight_map[from] << [to, price] }
  visited = Set.new
  minimum_cost = Float::INFINITY
  dfs = lambda do |source, stops, cost|
    return false if visited.include?(source)
    return false if stops > k

    if source == dst
      minimum_cost = [cost, minimum_cost].min
      return true
    end
    visited << source
    flight_map[source].each do |destination, price|
      dfs.call(destination, stops + 1, cost + price)
    end
    visited.delete(source)
  end
  dfs.call(src, -1, 0)
  minimum_cost == Float::INFINITY ? -1 : minimum_cost
end
