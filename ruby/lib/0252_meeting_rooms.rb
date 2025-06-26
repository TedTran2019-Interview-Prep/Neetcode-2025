# frozen_string_literal: true

def meeting_rooms(intervals)
  sorted_intervals = intervals.sort_by { |interval| interval[0] }

  sorted_intervals[0...-1].each_with_index do |interval, idx|
    next_interval = sorted_intervals[idx + 1]
    return false if next_interval[0] < interval[1]
  end

  true
end
