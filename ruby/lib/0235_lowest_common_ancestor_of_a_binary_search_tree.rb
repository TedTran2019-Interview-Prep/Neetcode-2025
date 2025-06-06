def lowest_common_ancestor(root, p, q)
  return nil unless root
  return root if root.val == p.val || root.val == q.val

  if p.val < root.val && q.val < root.val
    lowest_common_ancestor(root.left, p, q)
  elsif p.val > root.val && q.val > root.val
    lowest_common_ancestor(root.right, p, q)
  else
    root
  end
end

# First time I did this, I made a function to find ancestors
# Then I found ancestors of both p and q
# Then I returned the last common ancestor shared by p and q
# I think that's somewhat inefficient, so another solution!
# Value same as p/q OR a split == it's the LCA
# If both values in the left/right subtree, travel there
def lowest_common_ancestor(root, p, q)
  cur = root
  while cur
    if p.val > cur.val && q.val > cur.val
      cur = cur.right
    elsif p.val < cur.val && q.val < cur.val
      cur = cur.left
    else
      return cur
    end
  end
end
