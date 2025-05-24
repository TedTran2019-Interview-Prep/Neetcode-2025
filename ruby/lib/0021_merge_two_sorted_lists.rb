def merge_two_lists(list1, list2)
  merged = ListNode.new
  current = merged

  while list1 && list2
    if list1.val < list2.val
      current.next = list1
      list1 = list1.next
    else
      current.next = list2
      list2 = list2.next
    end
    current = current.next
  end

  current.next = list1 if list1
  current.next = list2 if list2

  merged.next
end
