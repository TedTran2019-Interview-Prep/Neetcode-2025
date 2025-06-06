# root of BST and K
# return kth smallest value of all nodes in tree
# Do in-order traversal and return the kth node visited
def kth_smallest(root, k)
  visit_count = 0
  target = nil
  dfs = lambda do |node|
    return if node.nil? || target

    dfs.call(node.left)
    visit_count += 1
    if visit_count == k
      target = node.val
      return
    end
    dfs.call(node.right)
  end
  dfs.call(root)
  target
end
