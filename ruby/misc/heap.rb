# frozen_string_literal: true

# Ruby's main algorithm gem (kanwei/algorithms) that Leetcode provides doesn't have functioning heaps
class Heap
  include Enumerable
  attr_reader :size
  alias length size

  def initialize(compare_symbol = :<, &compare_fn)
    @heap = []
    @size = 0
    initialize_compare(compare_symbol, &compare_fn)
  end

  def self.from_array(array, compare_symbol = :<, &compare_fn)
    new(compare_symbol, &compare_fn).tap { |heap| heap.heapify(array) }
  end

  def each(&block)
    to_a.each(&block)
  end

  def empty?
    @size.zero?
  end

  def peek
    @heap[0]
  end

  def pop
    return nil if empty?

    result = peek
    @size -= 1
    @heap[0] = @heap[@size] if @size.positive?
    rebalance_down(0) if @size.positive?
    @heap.pop
    result
  end

  def add(element)
    @heap[@size] = element
    @size += 1
    rebalance_up(@size - 1)
    self
  end

  alias << add

  def replace(element)
    @heap[0] = element
    rebalance_down(0)
  end

  def offer(element)
    if compare(peek, element)
      result = peek
      replace(element)
      result
    else
      element
    end
  end

  def clear
    @heap.clear
    @size = 0
  end

  def to_a
    @heap[0...@size]
  end

  def heapify(array)
    @heap = array.dup
    @size = @heap.size
    (@size / 2 - 1).downto(0) { |i| rebalance_down(i) }
    self
  end

  private

  def initialize_compare(symbol, &fn)
    @compare = if block_given?
                 fn
               elsif (symbol == :<) || symbol.nil?
                 ->(a, b) { a < b }
               elsif symbol == :>
                 ->(a, b) { a > b }
               else
                 raise ArgumentError, 'The comparison symbol needs to be either :> or :<'
               end
  end

  def compare(a, b)
    @compare.call(a, b)
  end

  def rebalance_up(i)
    parent_i = parent(i)

    return unless parent?(i) && compare(@heap[i], @heap[parent_i])

    @heap[i], @heap[parent_i] = @heap[parent_i], @heap[i]
    rebalance_up(parent_i)
  end

  def rebalance_down(i)
    smallest = i
    left_i = left(i)
    right_i = right(i)

    smallest = left_i if left?(i) && compare(@heap[left_i], @heap[smallest])
    smallest = right_i if right?(i) && compare(@heap[right_i], @heap[smallest])

    return unless smallest != i

    @heap[i], @heap[smallest] = @heap[smallest], @heap[i]
    rebalance_down(smallest)
  end

  def parent?(i)
    i >= 1
  end

  def parent(i)
    ((i - 1) / 2).floor
  end

  def left?(i)
    left(i) < @size
  end

  def left(i)
    i * 2 + 1
  end

  def right?(i)
    right(i) < @size
  end

  def right(i)
    i * 2 + 2
  end
end
