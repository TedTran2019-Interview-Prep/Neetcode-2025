# Union Find

Each element has a "root/parent" that owns the entire tree, can be itself.
Union combines two trees together, appending shorter to the longer.
E.g, longer's root will become the parent of the shorter's root
Find = finds the root of the tree

Rank = optimization (keep track of size of tree if this node were root)
Path compression = setting parent of result to its grandparent

- Safe because in worst case, a node's root can just be itself

- Two methods:
  - union
  - find
