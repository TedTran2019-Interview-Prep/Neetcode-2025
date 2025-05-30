# DFS solution
def preorder_traversal(root)
  result = []

  dfs = lambda do |node|
    return unless node

    result << node.val
    dfs.call(node.left) if node.left
    dfs.call(node.right) if node.right
  end

  dfs.call(root)
  result
end

# Preorder traversal but using iteration
# Use a stack and toss root in
# [1] -> eval 1, then toss right value first then left (right is evaluated last)
# [3 2] -> eval 2, toss in 5 4
# [3 5 4] -> eval 4, toss in nothing
# [3 5] -> eval 5, toss in 7/6
# [3 7 6] -> eval 6, 7, 3, 8, 9
# Using a stack to simulate recursive calls!
# Plan:
# stack = []
# result = []
# stack << root if root
# until stack.empty?
#     node = stack.pop
#     result << node.val
#     stack << node.right if node.right
#     stack << node.left if node.left
# result
def preorder_traversal(root)
  stack = []
  result = []
  stack << root if root
  until stack.empty?
    node = stack.pop
    result << node.val
    stack << node.right if node.right
    stack << node.left if node.left
  end
  result
end
