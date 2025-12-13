class Heap
  def initialize(&compare_function)
    @storage = ['dummy']
    @compare = compare_function || ->(a, b) { a < b }
  end

  def <<(element)
    @storage << element
    index = size
    heapify_up(index)
  end

  def pop
    return nil if @storage.length == 1

    to_return = @storage[1]
    @storage[1] = @storage[-1]
    @storage.pop

    heapify_down(1)
    to_return
  end

  def heapify(array)
    @storage = ['dummy'] + array
    (array.length / 2).downto(1).each { |idx| heapify_down(idx) }
  end

  def size
    @storage.length - 1
  end

  private

  def compare(a, b)
    @compare.call(a, b)
  end

  def parent(index)
    @storage[index / 2]
  end

  def left_child(index)
    @storage[index * 2]
  end

  def right_child(index)
    @storage[index * 2 + 1]
  end

  def heapify_down(index)
    while index * 2 <= size
      left_idx = index * 2
      right_idx = index * 2 + 1
      child_idx = left_idx

      # Right exists and belongs higher up in tree
      child_idx = right_idx if right_idx <= size && compare(@storage[right_idx], @storage[left_idx])

      break if compare(@storage[index], @storage[child_idx])

      @storage[index], @storage[child_idx] = @storage[child_idx], @storage[index]

      index = child_idx
    end
  end

  def heapify_up(index)
    while index > 1
      break if compare(parent(index), @storage[index])

      @storage[index], @storage[index / 2] = @storage[index / 2], @storage[index]
      index /= 2
    end
  end
end

# Tests
def assert(name)
  raise "❌ Failed: #{name}" unless yield

  puts "✅ Passed: #{name}"
end

# --------------------
# Min-heap tests
# --------------------
heap = Heap.new
[5, 3, 8, 1, 4].each { |x| heap << x }
assert('size after inserts') { heap.size == 5 }
assert('min element pops first') { heap.pop == 1 }
assert('next min') { heap.pop == 3 }
assert('next min') { heap.pop == 4 }
assert('next min') { heap.pop == 5 }
assert('next min') { heap.pop == 8 }
assert('empty pop returns nil') { heap.pop.nil? }

# --------------------
# Heapify test
# --------------------
heap = Heap.new
heap.heapify([9, 4, 7, 1, 3, 6])
result = []
result << heap.pop until heap.size.zero?
assert('heapify produces sorted order') do
  result == [1, 3, 4, 6, 7, 9]
end

# --------------------
# Max-heap tests
# --------------------
max_heap = Heap.new { |a, b| a > b }
[5, 3, 8, 1, 4].each { |x| max_heap << x }
assert('max heap pops max first') { max_heap.pop == 8 }
assert('next max') { max_heap.pop == 5 }
assert('next max') { max_heap.pop == 4 }
assert('next max') { max_heap.pop == 3 }
assert('next max') { max_heap.pop == 1 }
assert('empty max heap pop') { max_heap.pop.nil? }

puts "\n🎉 All tests passed!"
