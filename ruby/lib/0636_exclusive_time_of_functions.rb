# frozen_string_literal: true

def exclusive_time(n, logs)
  stack = []
  exclusive_time = Array.new(n, 0)
  logs.each do |log|
    id, code, time = log.split(':')
    id = id.to_i
    time = time.to_i
    if code == 'start'
      stack << [id, time]
    else
      start_id, start_time = stack.pop
      exclusive_time[start_id] += (time - start_time + 1)
      exclusive_time[stack.last.first] -= (time - start_time + 1) unless stack.empty?
    end
  end
  exclusive_time
end
