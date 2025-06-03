def partition(s)
  results = []
  dfs = lambda do |start, path|
    results << path.dup if start == s.length

    (start...s.length).each do |idx|
      part = s[start..idx]
      next unless part.palindrome?

      path << part
      dfs.call(idx + 1, path)
      path.pop
    end
  end
  dfs.call(0, [])
  results
end

class String
  def palindrome?
    self == reverse
  end
end
