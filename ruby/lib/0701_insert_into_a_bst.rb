# def insert_into_bst(root, val)
#     return TreeNode.new(val) if root.nil?

#     insert = lambda do |node|
#         return nil unless node

#         if val > node.val
#             if node.right
#                 insert.call(node.right)
#             else
#                 node.right = TreeNode.new(val)
#             end
#         else
#             if node.left
#                 insert.call(node.left)
#             else
#                 node.left = TreeNode.new(val)
#             end
#         end
#     end
#     insert.call(root)
#     root
# end

def insert_into_bst(root, val)
  return TreeNode.new(val) if root.nil?

  if val < root.val
    root.left = insert_into_bst(root.left, val)
  else
    root.right = insert_into_bst(root.right, val)
  end

  root
end
