# Neetcode solution
def reverse_k_group(head, k)
  dummy = ListNode.new(0, head)
  prev_group = dummy

  while true
    kth = get_kth(prev_group, k)
    break unless kth

    next_group = kth.next

    # Reversing group
    prev = kth.next
    curr = prev_group.next
    while curr != next_group
      tmp = curr.next
      curr.next = prev
      prev = curr
      curr = tmp
    end

    tmp = prev_group.next
    prev_group.next = kth
    prev_group = tmp
  end

  dummy.next
end

def get_kth(curr, k)
  while curr && k > 0
    curr = curr.next
    k -= 1
  end
  curr
end
