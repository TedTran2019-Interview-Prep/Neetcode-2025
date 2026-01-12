# frozen_string_literal: true

# Same solution but sorting/shifting instead of using a min heap for starting capital passes
def find_maximized_capital(k, w, profits, capital)
  # Info is: profit, starting capital
  info = profits.map.with_index { |profit, idx| [profit, capital[idx]] }
  info.sort_by! { |profit, starting_capital| starting_capital }
  max_heap = Heap.new { |a, b| a[0] > b[0] } # Max profit
  k.times do
    max_heap << info.shift while !info.empty? && info.first[1] <= w
    return w if max_heap.empty?

    profit, _starting_capital = max_heap.pop
    w += profit
  end
  w
end

# Naive times out on 39/40
def find_maximized_capital(k, w, profits, capital)
  # Info is: profit, starting capital
  info = profits.map.with_index { |profit, idx| [profit, capital[idx]] }
  min_heap = Heap.new { |a, b| a[1] < b[1] } # Min starting capital
  max_heap = Heap.new { |a, b| a[0] > b[0] } # Max profit
  min_heap.heapify(info)
  k.times do
    max_heap << min_heap.pop while !min_heap.empty? && min_heap.peek[1] <= w
    return w if max_heap.empty?

    profit, _starting_capital = max_heap.pop
    w += profit
  end
  w
end
