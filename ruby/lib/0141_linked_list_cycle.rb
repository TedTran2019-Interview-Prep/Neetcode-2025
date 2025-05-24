def hasCycle(head)
  return false unless head

  fast = head
  slow = head
  while fast && fast.next
    fast = fast.next.next
    slow = slow.next
    return true if fast == slow
  end

  false
end
