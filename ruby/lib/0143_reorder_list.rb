# Cleaner
def reorder_list(head)
  return if head.nil? || head.next.nil?

  slow = head
  fast = head.next # Stops slow at one before half-way mark
  while fast && fast.next
    slow = slow.next
    fast = fast.next.next
  end

  second = slow.next
  slow.next = nil # Breaks link between halves

  prev = nil
  while second
    temp = second.next
    second.next = prev
    prev = second
    second = temp
  end

  first = head
  second = prev
  while second # Second is always the smaller due to breakage/split
    temp1 = first.next
    temp2 = second.next

    first.next = second
    first = temp1

    second.next = first
    second = temp2
  end
end

# O(1) space solution but messy
def reorder_list(head)
  return head unless head && head.next

  # Find middle of LL
  fast = head
  slow = head
  while fast && fast.next
    fast = fast.next.next
    if fast.nil? || fast.next.nil?
      temp = slow.next
      slow.next = nil
      slow = temp
    else
      slow = slow.next
    end
  end

  # Reverse second half of LL
  current = slow
  prev = nil
  while current
    next_node = current.next
    current.next = prev
    prev = current
    current = next_node
  end

  # Merge first half and reversed second half (second half always holds more)
  first = head
  second = prev
  while first
    first_next = first.next
    second_next = second.next

    first.next = second
    first = first_next

    # Deal with odd-length edge case
    if first.nil? && second_next
      second = second_next
      second_next = nil
    end
    second.next = first
    second = second_next
  end

  head
end

# Cleaner left -> right, right -> left, left -> right intuition
# Since it ends when left == right, can just set the last value to nil (left or right)
def reorder_list(head)
  current = head
  # Create the nodes array
  nodes_array = []
  while current
    nodes_array << current
    current = current.next
  end

  left = 0
  right = nodes_array.length - 1
  while left < right
    nodes_array[left].next = nodes_array[right]
    left += 1
    break if left == right

    nodes_array[right].next = nodes_array[left]
    right -= 1
  end

  nodes_array[left].next = nil

  head
end

# Last-first connection intuition
def reorder_list(head)
  current = head
  # Create the nodes array
  nodes_array = []
  while current
    nodes_array << current
    current = current.next
  end

  current = ListNode.new
  left = 0
  right = nodes_array.length - 1
  while left < right
    left_node = nodes_array[left]
    right_node = nodes_array[right]
    current.next = left_node
    right_node.next = nil
    left_node.next = right_node
    current = right_node
    left += 1
    right -= 1
  end

  # Handle odd-length edge case
  if (nodes_array.length % 2).odd?
    current.next = nodes_array[left]
    nodes_array[left].next = nil
  end

  head
end
