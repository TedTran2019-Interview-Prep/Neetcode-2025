# Could clean this up by adding the carry check into the while loop
def add_two_numbers(l1, l2)
  carry = 0
  sum_list = ListNode.new(0)
  current = sum_list
  while l1 || l2
    l1_value = l1&.val || 0
    l2_value = l2&.val || 0

    value = l1_value + l2_value + carry
    carry = value / 10
    value %= 10

    new_node = ListNode.new(value)
    current.next = new_node
    current = current.next

    l1 = l1.next if l1
    l2 = l2.next if l2
  end

  unless carry.zero?
    new_node = ListNode.new(carry)
    current.next = new_node
    current = current.next
  end

  sum_list.next
end
