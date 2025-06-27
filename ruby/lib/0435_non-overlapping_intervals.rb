# frozen_string_literal: true

def erase_overlap_intervals(intervals)
  intervals = intervals.sort_by { |interval| interval[0] }
  prev = intervals.first
  removes = 0
  intervals[1..].each do |interval|
    if interval[0] < prev[1]
      prev = interval if interval[1] < prev[1]
      removes += 1
    else
      prev = interval
    end
  end
  removes
end
