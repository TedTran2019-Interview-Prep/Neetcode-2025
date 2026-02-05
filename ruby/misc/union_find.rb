# Example of UnionFind
class UnionFind
  def initialize(size)
    @parents = (0...size).to_a
    @rank = Array.new(size, 1)
  end

  # Find the root of that node
  def find(node)
    until node == @parents[node]
      @parents[node] = @parents[@parents[node]] # Path compression
      node = @parents[node]
    end
    node
  end

  def union(node1, node2)
    root1 = find(node1)
    root2 = find(node2)
    return false if root1 == root2 # Already in same set

    if @rank[root1] > @rank[root2]
      @rank[root1] += @rank[root2]
      @parents[root2] = root1
    else
      @rank[root2] += @rank[root1]
      @parents[root1] = root2
    end
  end
  true
end

# Used AI to generate tests for my union find code
def test_union_find
  uf = UnionFind.new(10)

  # Case 1: Initial State
  # Every node should be its own root
  puts 'Test 1: Initial state...'
  (0..9).each { |i| raise 'Fail' unless uf.find(i) == i }
  puts 'Passed!'

  # Case 2: Basic Union
  # Connect 1-2 and 3-4
  puts 'Test 2: Basic Union...'
  uf.union(1, 2)
  uf.union(3, 4)
  raise 'Fail' unless uf.find(1) == uf.find(2)
  raise 'Fail' unless uf.find(3) == uf.find(4)
  raise 'Fail' if uf.find(1) == uf.find(3) # Should still be separate

  puts 'Passed!'

  # Case 3: Chained Union (Transitivity)
  # Connect 2-3. Now 1, 2, 3, and 4 should all be in the same set.
  puts 'Test 3: Chained Union...'
  uf.union(2, 3)
  raise 'Fail' unless uf.find(1) == uf.find(4)

  puts 'Passed!'

  # Case 4: Redundant Union
  # Unioning nodes already in the same set shouldn't break anything
  puts 'Test 4: Redundant Union...'
  root_before = uf.find(1)
  uf.union(1, 4)
  raise 'Fail' unless uf.find(1) == root_before

  puts 'Passed!'

  # Case 5: Large Scale Connectivity
  # Connect almost everything
  puts 'Test 5: Large connectivity...'
  (0..8).each { |i| uf.union(i, i + 1) }
  all_same = (0..9).all? { |i| uf.find(i) == uf.find(0) }
  raise 'Fail' unless all_same

  puts 'Passed!'

  puts '--- All tests passed! ---'
end

test_union_find
