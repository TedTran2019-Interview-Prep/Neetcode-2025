# frozen_string_literal: true

# Better solution utilizing the fact that order matters
class FreqStack
  def initialize
    @stack = Hash.new { |h, k| h[k] = [] }
    @count = Hash.new(0)
    @max_freq = 0
  end

  def push(val)
    @count[val] += 1
    nbr = @count[val]
    @stack[nbr] << val
    @max_freq = nbr if nbr > @max_freq
  end

  def pop
    key = @stack[@max_freq].pop
    @max_freq -= 1 while @max_freq > -1 && @stack[@max_freq].empty?
    @count[key] -= 1
    key
  end
end

# This one also times out
class FreqStack
  def initialize
    @stack = Hash.new { |h, k| h[k] = [] }
    @count = Hash.new { |h, k| h[k] = Set.new }
    @max_freq = 0
    @id = 0
  end

  def push(val)
    # Add ID to stack for that val
    @stack[val] << @id
    @id += 1
    # Keep track of vals per count in a set
    ids = @stack[val]
    @count[ids.length - 1].delete(val)
    @count[ids.length] << val
    @max_freq = ids.length if ids.length > @max_freq
  end

  def pop
    max_key = nil
    max_id = -1
    @count[@max_freq].each do |key|
      if max_key.nil? || (!@stack[key].empty? && max_id < @stack[key][-1])
        max_key = key
        max_id = @stack[key][-1]
      end
    end
    # Remove ID from stack for that val
    @stack[max_key].pop
    # Keep track of vals per count in a set
    ids = @stack[max_key]
    @count[ids.length + 1].delete(max_key)
    @count[ids.length] << max_key
    @max_freq -= 1 while @max_freq > -1 && @count[@max_freq].empty?
    max_key
  end
end

# Naive
class FreqStack
  def initialize
    @stack = Hash.new { |h, k| h[k] = [] }
    @id = 0
  end

  def push(val)
    @stack[val] << @id
    @id += 1
  end

  def pop
    max_freq = 0
    max_id = -1
    max_key = nil
    @stack.each do |key, ids|
      next unless ids.length > max_freq ||
                  (ids.length == max_freq && ids[-1] > max_id)

      max_freq = ids.length
      max_id = ids[-1]
      max_key = key
    end
    @stack[max_key].pop
    max_key
  end
end
