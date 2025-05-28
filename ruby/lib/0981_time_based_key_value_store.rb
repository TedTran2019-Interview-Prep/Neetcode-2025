# Not necessary to track max because binary search already narrows down to closest possible
class TimeMap
  def initialize
    @map = Hash.new { |h, k| h[k] = [] }
  end

  def set(key, value, timestamp)
    @map[key] << [value, timestamp]
  end

  def get(key, timestamp)
    values = @map[key]
    value = ''
    left = 0
    right = values.length - 1
    # max_timestamp = -Float::INFINITY
    while left <= right
      middle = (left + right) / 2
      value_prev, timestamp_prev = values[middle]

      if timestamp_prev == timestamp
        return value_prev
      elsif timestamp_prev < timestamp
        # if timestamp_prev > max_timestamp
        # max_timestamp = [max_timestamp, timestamp_prev].max
        value = value_prev
        # end
        left = middle + 1
      else
        right = middle - 1
      end
    end

    value
  end
end
