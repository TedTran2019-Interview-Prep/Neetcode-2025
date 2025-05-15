# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
  current = head
  prev = nil

  while current
    second = current.next
    break if second.nil?

    third = second.next

    current.next = third
    second.next = current
    if prev.nil?
      head = second
    else
      prev.next = second
    end

    prev = current
    current = third
  end

  head
end
