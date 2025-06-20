# frozen_string_literal: true

def num_buses_to_destination(routes, source, target)
  return 0 if source == target

  stop_to_bus = Hash.new { |h, k| h[k] = [] }
  routes.each_with_index do |route, idx|
    route.each { |stop| stop_to_bus[stop] << idx }
  end

  buses_taken = 0
  visited_stops = Set.new([source])
  visited_buses = Set.new
  queue = [source]

  until queue.empty?
    buses_taken += 1
    next_queue = []

    queue.each do |stop|
      stop_to_bus[stop].each do |bus|
        next if visited_buses.include?(bus)

        visited_buses << bus

        routes[bus].each do |next_stop|
          return buses_taken if next_stop == target
          next if visited_stops.include?(next_stop)

          visited_stops << next_stop
          next_queue << next_stop
        end
      end
    end

    queue = next_queue
  end

  -1
end

def num_buses_to_destination(routes, source, target)
  return 0 if source == target

  bus_route_map = create_bus_route_map(routes)
  source_routes = bus_route_map[source]
  ending_routes = bus_route_map[target].to_set
  routing_map = create_routing_map(bus_route_map)

  queue = source_routes
  buses = 0
  visited_routes = Set.new

  until queue.empty?
    new_queue = []
    buses += 1
    queue.each do |route|
      next if visited_routes.include?(route)
      return buses if ending_routes.include?(route)

      visited_routes << route
      # new_queue.concat(routing_map[route].to_a)
      routing_map[route].each { |route| new_queue << route }
    end
    queue = new_queue
  end

  -1
end

def create_bus_route_map(routes)
  map = Hash.new { |h, k| h[k] = [] }
  routes.each_with_index do |route, index|
    route.each do |stop|
      map[stop] << index
    end
  end
  map
end

def create_routing_map(bus_route_map)
  map = Hash.new { |h, k| h[k] = Set.new }
  bus_route_map.each do |stop, routes|
    next unless routes.length > 1

    routes.each do |route|
      routes.each { |other_route| map[route] << other_route unless route == other_route }
    end
  end
  map
end
