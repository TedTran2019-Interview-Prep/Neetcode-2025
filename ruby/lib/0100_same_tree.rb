def is_same_tree(p, q)
  return false if (p && !q) || (!p && q)
  return true if !p && !q

  is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right) && p.val == q.val
end
