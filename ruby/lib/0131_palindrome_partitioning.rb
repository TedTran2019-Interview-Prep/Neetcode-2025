# Redo since I ran into this problem again a week later on 6/9/25
def partition(s)
  result = []
  dfs = lambda do |start, path|
    if start == s.length
      result << path.dup
      return
    end
    (start...s.length).each do |index|
      beginning = s[start..index]
      next unless beginning == beginning.reverse

      path << beginning
      dfs.call(index + 1, path)
      path.pop
    end
  end
  dfs.call(0, [])
  result
end

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
