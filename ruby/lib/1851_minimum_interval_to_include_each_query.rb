# frozen_string_literal: true

def min_interval(intervals, queries)
  result = Array.new(queries.length)
  intervals = intervals.sort_by { |interval| interval[0] }
  queries = queries.each_with_index.sort_by { |query| query[0] }
  interval_idx = 0
  min_heap = Heap.new { |a, b| a[0] < b[0] } # Size, End
  queries.each do |query, original_idx|
    min_heap.pop until min_heap.empty? || min_heap.peek[1] >= query

    while interval_idx < intervals.length
      left, right = intervals[interval_idx]
      break if left > query

      min_heap << [right - left + 1, right] if query.between?(left, right)
      interval_idx += 1
    end

    result[original_idx] = min_heap.empty? ? -1 : min_heap.peek[0]
  end
  result
end
