def reverse_list(head)
  reversed = nil
  current = head

  while current
    next_node = current.next
    current.next = reversed
    reversed = current
    current = next_node
  end

  reversed
end
