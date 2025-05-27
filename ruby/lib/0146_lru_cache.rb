class Node
  attr_accessor :val, :next, :prev, :key

  def initialize(val, key = nil, next_value = nil, prev_value = nil)
    @val = val
    @next = next_value
    @prev = prev_value
    @key = key
  end
end

class LRUCache
  def initialize(capacity)
    @capacity = capacity
    @length = 0
    @node_map = {}

    @head = Node.new(:HEAD)
    @tail = Node.new(:TAIL)
    @head.next = @tail
    @tail.prev = @head
  end

  def get(key)
    node = @node_map[key]
    return -1 unless node

    value = node.val
    move_to_front(node)
    value
  end

  def put(key, value)
    node = @node_map[key]
    if node
      node.val = value
      move_to_front(node)
    else
      @length += 1
      new_node = Node.new(value, key)
      @node_map[key] = new_node
      # Move to front
      new_node.prev = @head
      new_node.next = @head.next
      @head.next.prev = new_node
      @head.next = new_node
      # If length > capacity remove tail node
      if @length > @capacity
        @length -= 1
        @node_map.delete(@tail.prev.key)
        @tail.prev.prev.next = @tail
        @tail.prev = @tail.prev.prev
      end
    end
  end

  private

  def move_to_front(node)
    node.prev.next = node.next
    node.next.prev = node.prev
    node.prev = @head
    node.next = @head.next
    @head.next.prev = node
    @head.next = node
  end

  def print_list
    current = @head.next
    while current
      print current.val
      print ' '
      current = current.next
    end
    puts
  end
end
