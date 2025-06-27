# frozen_string_literal: true

# Cleaner version, utilizing fact that it's sorted
def merge(intervals)
  intervals = intervals.sort_by { |interval| interval[0] }
  output = [intervals.first]
  intervals[1..].each do |interval|
    end_time = output[-1][1]
    if interval[0] <= end_time
      output[-1][1] = [interval[1], output[-1][1]].max
    else
      output << interval
    end
  end
  output
end

def merge(intervals)
  intervals = intervals.sort_by { |interval| interval[0] }
  result = []
  prev = intervals.first
  intervals[1..].each do |interval|
    if prev[0] > interval[1] || prev[1] < interval[0]
      result << prev
      prev = interval
    else
      prev = [
        [prev[0], interval[0]].min,
        [prev[1], interval[1]].max
      ]
    end
  end
  result << prev
  result
end
