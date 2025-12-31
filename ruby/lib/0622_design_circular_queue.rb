# frozen_string_literal: true

# Array w/ index math implementation
class MyCircularQueue
  def initialize(k)
    @front_idx = 0
    @rear_idx = -1
    @count = 0
    @capacity = k
    @queue = Array.new(k)
  end

  def en_queue(value)
    return false if is_full

    @rear_idx = (@rear_idx + 1) % @capacity
    @queue[@rear_idx] = value
    @count += 1
    true
  end

  def de_queue
    return false if is_empty

    @queue[@front_idx] = nil
    @count -= 1
    if is_empty
      @front_idx = 0
      @rear_idx = -1
    else
      @front_idx = (@front_idx + 1) % @capacity
    end
    true
  end

  def front
    return -1 if is_empty

    @queue[@front_idx]
  end

  def rear
    return -1 if is_empty

    @queue[@rear_idx]
  end

  def is_empty
    @count.zero?
  end

  def is_full
    @count == @capacity
  end
end

# Doubly linked list implementation
class LinkedList
  attr_reader :length

  def initialize
    @head = Node.new(:HEAD, Node.new(:TAIL))
    @tail = @head.next
    @tail.prev = @head
    @length = 0
  end

  def front
    return nil if length.zero?

    @head.next.value
  end

  def rear
    return nil if length.zero?

    @tail.prev.value
  end

  def is_empty
    length.zero?
  end

  def en_queue(value)
    new_node = Node.new(value)
    new_node.next = @tail
    new_node.prev = @tail.prev
    @tail.prev.next = new_node
    @tail.prev = new_node
    @length += 1
  end

  def de_queue
    return nil if is_empty

    node = @head.next
    @head.next = node.next
    @head.next.prev = @head
    @length -= 1
    node.value
  end
end

class Node
  attr_accessor :value, :next, :prev

  def initialize(value = nil, nxt = nil, prev = nil)
    @value = value
    @next = nxt
    @prev = prev
  end
end

class MyCircularQueue
  def initialize(k)
    @size = k
    @list = LinkedList.new
  end

  def en_queue(value)
    return false if is_full

    @list.en_queue(value)
    true
  end

  def de_queue
    return false if is_empty

    @list.de_queue
    true
  end

  def front
    @list.front || -1
  end

  def rear
    @list.rear || -1
  end

  def is_empty
    @list.is_empty
  end

  def is_full
    @list.length == @size
  end
end
