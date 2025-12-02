# frozen_string_literal: true

# Greedy
def max_run_time(n, batteries)
  batteries.sort!
  live_start_idx = batteries.length - n
  live_batteries = batteries[live_start_idx..]
  extra_power = batteries[0...live_start_idx].sum
  (0...n - 1).each do |idx|
    next_battery = live_batteries[idx + 1]
    current_battery = live_batteries[idx]
    batteries_to_match = idx + 1
    required_power = (next_battery - current_battery) * batteries_to_match
    return live_batteries[idx] + (extra_power / (idx + 1)) unless extra_power >= required_power

    extra_power -= required_power
  end
  live_batteries[n - 1] + (extra_power / n)
end

# Binary search
def max_run_time(n, batteries)
  batteries.sort!
  left = 1
  right = batteries.sum / n
  while left < right
    middle = right - (right - left) / 2
    extra = 0
    batteries.each { |battery| extra += [battery, middle].min }
    if extra >= n * middle
      left = middle
    else
      right = middle - 1
    end
  end
  left
end
