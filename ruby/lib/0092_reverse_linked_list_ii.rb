# frozen_string_literal: true

def reverse_between(head, left, right)
  dummy = ListNode.new(0, head)
  # Get pre-left
  pre_left = dummy
  (left - 1).times { pre_left = pre_left.next }
  # get left
  ptr = pre_left.next
  # Reverse from left to right
  prev = nil
  (right - left + 1).times do
    tmp = ptr.next
    ptr.next = prev
    prev = ptr
    ptr = tmp
  end

  # Need to attach post_right to end of list, ptr is at post_right now
  pre_left.next.next = ptr
  pre_left.next = prev

  dummy.next
end

def reverse_between(head, left, right)
  dummy = ListNode.new(0, head)
  ptr = head
  pre_left = nil
  # Get pre-left and left
  (left - 1).times do
    pre_left = ptr
    ptr = ptr.next
  end

  # Reverse from left to right
  prev = nil
  (right - left + 1).times do
    tmp = ptr.next
    ptr.next = prev
    prev = ptr
    ptr = tmp
  end

  # Need to attach post_right to end of list, ptr is at post_right now
  if pre_left
    pre_left.next.next = ptr
    pre_left.next = prev
  else
    dummy.next = prev
    head.next = ptr
  end

  dummy.next
end
