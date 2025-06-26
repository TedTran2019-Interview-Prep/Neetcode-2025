# frozen_string_literal: true

require_relative '../misc/heap'

def min_meeting_rooms(intervals)
  sorted_intervals = intervals.sort_by { |interval| interval[0] }
  min_heap = Heap.new
  max_days = 0
  sorted_intervals.each do |interval|
    start_time, end_time = interval
    min_heap.pop until min_heap.empty? || start_time >= min_heap.peek
    min_heap << end_time
    max_days = [min_heap.length, max_days].max
  end

  max_days
end
