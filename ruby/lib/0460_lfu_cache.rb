# frozen_string_literal: true

# Doubly linked list implementation
class Node
  attr_accessor :value, :next, :prev

  def initialize(value = nil, nxt = nil, prev = nil)
    @value = value
    @next = nxt
    @prev = prev
  end
end

# Assumes values in linked list are distinct
# I like this implementation I came up with a lot, easy to reason about
class LinkedList
  def initialize
    @head = Node.new(:head, Node.new(:tail))
    @tail = @head.next
    @tail.prev = @head
    @map = {}
  end

  def shift
    return false if @head.next.value == :tail

    after_head = @head.next
    @head.next = after_head.next
    @head.next.prev = @head
    @map.delete(after_head.value)
    after_head.value
  end

  def pop
    return false if @tail.prev.value == :head

    before_tail = @tail.prev
    @tail.prev = before_tail.prev
    @tail.prev.next = @tail
    @map.delete(before_tail.value)
    before_tail.value
  end

  def unshift(value)
    after_head = @head.next
    new_node = Node.new(value, after_head, @head)
    @head.next = new_node
    after_head.prev = new_node
    @map[value] = new_node
  end

  def push(value)
    before_tail = @tail.prev
    new_node = Node.new(value, @tail, before_tail)
    @tail.prev = new_node
    before_tail.next = new_node
    @map[value] = new_node
  end

  def delete(value)
    node = @map[value]
    @map.delete(value)
    before_node = node.prev
    after_node = node.next
    before_node.next = after_node
    after_node.prev = before_node
  end

  def empty?
    @head.next.value == :tail
  end
end

class LFUCache
  def initialize(capacity)
    @capacity = capacity
    @cache = {}
    @frequency = Hash.new { |h, k| h[k] = LinkedList.new }
    @count = Hash.new(0)
  end

  def get(key)
    return -1 unless @cache.key?(key)

    increment_count(key)
    @cache[key]
  end

  def put(key, value)
    if @cache.key?(key)
      @cache[key] = value
      increment_count(key)
    else
      eject_lfu if full?
      @cache[key] = value
      @frequency[1].push(key)
      @count[key] += 1
    end
  end

  private

  def full?
    @cache.size == @capacity
  end

  def eject_lfu
    freq = 1
    freq += 1 while @frequency[freq].empty?
    key = @frequency[freq].shift
    @cache.delete(key)
    @count[key] = 0
  end

  def increment_count(key)
    prev_freq = @count[key]
    @count[key] += 1
    freq = @count[key]
    @frequency[prev_freq].delete(key)
    @frequency[freq].push(key)
  end
end

# Array implementation
# O(N) for put
class LFUCache
  def initialize(capacity)
    @capacity = capacity
    @cache = {}
    @frequency = Hash.new { |h, k| h[k] = [] }
    @count = Hash.new(0)
  end

  def get(key)
    return -1 unless @cache.key?(key)

    increment_count(key)
    @cache[key]
  end

  def put(key, value)
    if @cache.key?(key)
      @cache[key] = value
      increment_count(key)
    else
      eject_lfu if full?
      @cache[key] = value
      @frequency[1] << key
      @count[key] += 1
    end
  end

  private

  def full?
    @cache.size == @capacity
  end

  def eject_lfu
    freq = 1
    freq += 1 while @frequency[freq].empty?
    key = @frequency[freq].shift
    @cache.delete(key)
    @count[key] = 0
  end

  def increment_count(key)
    prev_freq = @count[key]
    @count[key] += 1
    freq = @count[key]
    @frequency[prev_freq].delete(key)
    @frequency[freq] << key
  end
end
