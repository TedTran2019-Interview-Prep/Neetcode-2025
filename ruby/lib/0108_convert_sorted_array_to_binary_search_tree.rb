# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} nums
# @return {TreeNode}

def sorted_array_to_bst(nums)
  convert = lambda do |left, right|
    return nil if left > right

    middle = (left + right) / 2
    root = TreeNode.new(nums[middle])
    root.left = convert.call(left, middle - 1)
    root.right = convert.call(middle + 1, right)

    root
  end
  convert.call(0, nums.length - 1)
end
