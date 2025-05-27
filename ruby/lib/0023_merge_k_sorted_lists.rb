# Merge solution
def merge_k_lists(lists)
  until lists.length <= 1
    new_list = []

    (0...lists.length).step(2).each do |idx|
      l1 = lists[idx]
      l2 = lists[idx + 1]
      new_list << merge(l1, l2)
    end

    lists = new_list
  end
  lists[0]
end

def merge(l1, l2)
  dummy = ListNode.new
  current = dummy
  while l1 && l2
    if l1.val < l2.val
      current.next = l1
      current = current.next
      l1 = l1.next
    else
      current.next = l2
      current = current.next
      l2 = l2.next
    end
  end

  current.next = l1 if l1
  current.next = l2 if l2
  dummy.next
end

# Heap solution
def merge_k_lists(lists)
  min_heap = Heap.new { |a, b| a[0] < b[0] }
  dummy = ListNode.new(:DUMMY)
  current = dummy

  lists.each_with_index do |list, index|
    next unless list

    min_heap << [list.val, list, index]
    lists[index] = lists[index].next
  end

  until min_heap.empty?
    val, node, index = min_heap.pop
    current.next = node
    current = current.next
    if lists[index]
      min_heap << [lists[index].val, lists[index], index]
      lists[index] = lists[index].next
    end
  end

  current.next = nil
  dummy.next
end
