# Same solution but slightly cleaner
def copyRandomList(head)
  return head unless head

  # Interleave original and new nodes
  current = head
  while current
    copy = Node.new(current.val)
    copy.next = current.next
    current.next = copy
    current = copy.next
  end

  # Replace new node's random with new nodes
  current = head
  while current
    current.next.random = current.random.next if current.random

    current = current.next.next
  end

  # Split up nodes
  # Have to reconnect original nodes to pass LC test cases too
  original = head
  copy_head = head.next
  copy = copy_head
  while copy&.next
    original.next = original.next.next
    copy.next = copy.next.next
    original = original.next
    copy = copy.next
  end
  original.next = nil

  copy_head
end

# O(1) space interleaving solution
def copyRandomList(head)
  return head unless head

  # Interleave original and new nodes
  current = head
  while current
    new_node = Node.new(current.val)
    new_node.random = current.random
    placeholder = current.next
    current.next = new_node
    new_node.next = placeholder
    current = placeholder
  end

  # Replace new node's random with new nodes
  current = head.next
  while current
    current.random = current.random.next if current.random
    break if current.next.nil?

    current = current.next.next
  end

  # Split up nodes
  # Have to reconnect original nodes to pass LC test cases too
  new_list = head.next
  current = new_list
  old_list = head
  while current&.next
    temp = current.next
    current.next = current.next.next
    old_list.next = temp
    old_list = old_list.next
    current = current.next
  end
  # New list ends pointing to nil, old list ends pointing to its duplicate
  old_list.next = nil

  new_list
end

# Neetcode solution
def copyRandomList(head)
  current = head
  node_map = {}
  while current
    copy = Node.new(current.val)
    node_map[current] = copy
    current = current.next
  end

  current = head
  while current
    copy = node_map[current]
    copy.next = node_map[current.next]
    copy.random = node_map[current.random]
    current = current.next
  end

  node_map[head]
end

# My solution that only failed because I forgot current = current.next
# Don't listen to ChatGPT-- it'll lead you onto wild goose chases and waste absurd amounts of time
def copyRandomList(head)
  dummy = Node.new(0)
  current = dummy
  node_map = {}
  # Creating new LL and mapping old:new
  while head
    new_node = Node.new(head.val)
    new_node.random = head.random
    current.next = new_node
    current = current.next
    node_map[head] = new_node
    head = head.next
  end

  # Replacing random with new nodes
  current = dummy.next
  while current
    current.random = node_map[current.random] if current.random
    current = current.next
  end

  dummy.next
end
