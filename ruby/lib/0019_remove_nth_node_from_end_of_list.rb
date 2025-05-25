def remove_nth_from_end(head, n)
  fast = head
  until n.zero?
    fast = fast.next
    n -= 1
  end
  prev = nil
  slow = head
  while fast
    prev = slow
    fast = fast.next
    slow = slow.next
  end

  return head.next if prev.nil?

  prev.next = slow.next

  head
end
