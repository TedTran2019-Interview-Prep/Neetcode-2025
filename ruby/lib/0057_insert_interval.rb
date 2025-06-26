# frozen_string_literal: true

# NC Solution
def insert(intervals, new_interval)
  result = []
  intervals.each_with_index do |interval, index|
    if new_interval[1] < interval[0]
      result << new_interval
      return result + intervals[index..]
    elsif new_interval[0] > interval[1]
      result << interval
    else
      new_interval = [
        [new_interval[0], interval[0]].min,
        [new_interval[1], interval[1]].max
      ]
    end
  end
  result.append(new_interval)
  result
end

def insert(intervals, new_interval)
  return [new_interval] if intervals.empty?

  result = []
  inserted = false

  intervals.each do |interval|
    # No overlap, and current interval ends before new starts
    if interval[1] < new_interval[0]
      result << interval
    # No overlap, and current interval starts after new ends
    elsif interval[0] > new_interval[1]
      unless inserted
        result << new_interval
        inserted = true
      end
      result << interval
    else
      new_interval = [
        [interval[0], new_interval[0]].min,
        [interval[1], new_interval[1]].max
      ]
    end
  end

  result << new_interval unless inserted
  result
end
