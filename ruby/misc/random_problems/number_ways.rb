def number_ways(n, faces, total)
  result = 0

  dfs = lambda do |sum, dice_amount|
    return if sum > total
    return if dice_amount.negative?
    if sum == total && dice_amount.zero?
      result += 1
    end

    (1..faces).each do |face|
      dfs.call(sum + face, dice_amount - 1)
    end
  end

  dfs.call(0, n)
  result
end

def number_ways(n, faces, total)
  result = []

  dfs = lambda do |sum, path|
    return if sum > total
    return if path.length > n

    result << path.dup if sum == total && path.length == n

    (1..faces).each do |face|
      path << face
      dfs.call(sum + face, path)
      path.pop
    end
  end

  dfs.call(0, [])
  result.length
end

def number_ways(n, faces, total)
  result = 0

  dfs = lambda do |sum, path|
    return if sum > total
    return if path.length > n

    result += 1 if sum == total && path.length == n

    (1..faces).each do |face|
      path << face
      dfs.call(sum + face, path)
      path.pop
    end
  end

  dfs.call(0, [])
  result
end

puts number_ways(1, 6, 3) # 1
puts number_ways(3, 6, 7) # 15
puts number_ways(2, 5, 8) # 3
